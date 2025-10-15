import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
    String nationalId,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailOrNationalId(
    String emailOrNationalId,
    String password,
  );

  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String nationalId});

  Future<bool> isNationalIdRegistered(String nationalId);
}
