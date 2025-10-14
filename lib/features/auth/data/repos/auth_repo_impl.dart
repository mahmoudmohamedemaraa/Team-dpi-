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
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        uId: user.uid,
        phoneNumber: phoneNumber,
        nationalId: nationalId,
      );

      await saveUserData(user: userEntity);
      await addUserData(user: userEntity);

      var storedUser = await getUserData(uId: user.uid);
      return right(storedUser);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoimpl createUserWithEmailAndPassword: $e');
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
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<bool> isNationalIdRegistered(String nationalId) async {
    var users = await databaseService.getData(
      path: BackendEndpoint.getUserData,
    );
    if (users is List) {
      for (var u in users) {
        try {
          if (u is Map<String, dynamic>) {
            final nid = u['nationalId'];
            if (nid != null) {
              if (nid is num && nid == nationalId) return true;
              if (nid is String && nid == nationalId.toString()) return true;
            }
          }
        } catch (_) {}
      }
    }
    return false;
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kUserData, jsonData);
  }

  Future<String> getEmailByNationalId(String nationalId) async {
    try {
      var users = await databaseService.getData(
        path: BackendEndpoint.getUserData,
      );

      if (users is List) {
        for (var userData in users) {
          if (userData is Map<String, dynamic>) {
            final nid = userData['nationalId'];

            if (nid != null && nid is String) {
              if (nid == nationalId) {
                final email = userData['email'];
                if (email != null && email is String) {
                  return email;
                }
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

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailOrNationalId(
    String emailOrNationalId,
    String password,
  ) async {
    try {
      String email;

      if (RegExp(r'^\d+$').hasMatch(emailOrNationalId)) {
        final emailFromNID = await getEmailByNationalId(emailOrNationalId);

        if (emailFromNID == null) {
          return left(
            ServerFailure('الرقم القومي غير مسجل. الرجاء التحقق من البيانات.'),
          );
        }

        email = emailFromNID;
      } else {
        email = emailOrNationalId;
      }

      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userEntity = await getUserData(uId: user.uid);
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
}
