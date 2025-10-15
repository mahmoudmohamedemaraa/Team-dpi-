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

      var storedUser = await getUserData(nationalId: nationalId);
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
      documentId: user.nationalId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String nationalId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: nationalId,
    );

    if (userData == null) {
      throw CustomException(message: 'لم يتم العثور على بيانات المستخدم.');
    }

    return UserModel.fromJson(userData);
  }

  @override
  Future<bool> isNationalIdRegistered(String nationalId) async {
    var exists = await databaseService.checksIfDataExists(
      path: BackendEndpoint.getUserData,
      documentId: nationalId,
    );
    return exists;
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kUserData, jsonData);
  }

  Future<String> getEmailByNationalId(String nationalId) async {
    try {
      var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData,
        documentId: nationalId,
      );

      if (userData == null) {
        throw CustomException(
          message: 'الرقم القومي غير مسجل. الرجاء التحقق من البيانات.',
        );
      }

      final email = userData['email'];
      if (email != null && email is String) {
        return email;
      } else {
        throw CustomException(
          message: 'لا يوجد بريد إلكتروني مرتبط بهذا الرقم القومي.',
        );
      }
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
      String nationalId = emailOrNationalId;

      if (RegExp(r'^\d+$').hasMatch(emailOrNationalId)) {
        final emailFromNID = await getEmailByNationalId(emailOrNationalId);

        if (emailFromNID.isEmpty) {
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
}
