import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../contants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/backend_endpoint.dart';
import '../../../../core/utils/shared_preferences_singleton.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImplementation({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
    String nationalId,
  ) async {
    User? user;
    try {
      final exists = await databaseService.checksIfDataExists(
        path: BackendEndpoint.addUserData,
        documentId: nationalId,
      );

      if (exists) {
        return left(ServerFailure('الرقم القومي مسجل بالفعل.'));
      }

      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userEntity = UserEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        uId: user.uid,
        phoneNumber: phoneNumber,
        nationalId: nationalId,
      );

      await saveUserData(user: userEntity);
      await addUserData(user: userEntity);

      final storedUser = await getUserData(nationalId: nationalId);
      return right(storedUser);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in createUserWithEmailAndPassword: $e');
      return left(
        ServerFailure(
          'حدث خطأ غير معروف أثناء إنشاء الحساب. الرجاء المحاولة مرة أخرى.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.nationalId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String nationalId}) async {
    final userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: nationalId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<bool> isNationalIdRegistered(String nationalId) async {
    try {
      return await databaseService.checksIfDataExists(
        path: BackendEndpoint.getUserData,
        documentId: nationalId,
      );
    } catch (e) {
      log('Error checking National ID: $e');
      return false;
    }
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    final jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kUserData, jsonData);
    SharedPreferencesSingleton.setBool(isLoggedIn, true);
  }

  Future<String> getEmailByNationalId(String nationalId) async {
    try {
      final users = await databaseService.getData(
        path: BackendEndpoint.getUserData,
      );

      if (users is List) {
        for (final userData in users) {
          if (userData is Map<String, dynamic>) {
            final nid = userData['nationalId'];
            if (nid != null && nid.toString() == nationalId) {
              final email = userData['email'];
              if (email != null && email is String) {
                return email;
              }
            }
          }
        }
      }

      throw CustomException(
        message: 'الرقم القومي غير مسجل. الرجاء التحقق من البيانات.',
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(
        message: 'حدث خطأ أثناء البحث عن البيانات. الرجاء المحاولة مرة أخرى.',
      );
    }
  }

  Future<String> getNationalIdByEmail(String email) async {
    try {
      final users = await databaseService.getData(
        path: BackendEndpoint.getUserData,
      );

      if (users is List) {
        for (final userData in users) {
          if (userData is Map<String, dynamic>) {
            final mail = userData['email'];
            if (mail != null && mail == email) {
              return userData['nationalId'];
            }
          }
        }
      }

      throw CustomException(
        message: 'لم يتم العثور على الرقم القومي لهذا الإيميل.',
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(message: 'حدث خطأ أثناء استرجاع الرقم القومي.');
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailOrNationalId(
    String emailOrNationalId,
    String password,
  ) async {
    try {
      String email;

      if (RegExp(r'^\d+$').hasMatch(emailOrNationalId)) {
        email = await getEmailByNationalId(emailOrNationalId);
      } else {
        email = emailOrNationalId;
      }

      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final nationalId = await getNationalIdByEmail(email);
      final userEntity = await getUserData(nationalId: nationalId);

      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailOrNationalId: ${e.toString()}');
      return left(
        ServerFailure(
          'حدث خطأ غير معروف أثناء تسجيل الدخول. الرجاء المحاولة مرة أخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String emailOrNationalId) async {
    try {
      String email;

      // Check if input is national ID or email
      if (RegExp(r'^\d+$').hasMatch(emailOrNationalId)) {
        // It's a national ID, get the email
        email = await getEmailByNationalId(emailOrNationalId);
      } else {
        // It's already an email
        email = emailOrNationalId;
      }

      await firebaseAuthService.sendPasswordResetEmail(email: email);
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in resetPassword: ${e.toString()}');
      return left(
        ServerFailure('حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseAuthService.signOut();
      await SharedPreferencesSingleton.remove(kUserData);
      await SharedPreferencesSingleton.remove(isLoggedIn);
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signOut: ${e.toString()}');
      return left(
        ServerFailure('حدث خطأ أثناء تسجيل الخروج. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }
}
