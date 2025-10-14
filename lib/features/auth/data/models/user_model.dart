import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.uId,
    required super.phoneNumber,
    required super.nationalId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? 'No First Name',
      lastName: json['lastName'] ?? 'No Last Name',
      email: json['email'] ?? 'No Email',
      uId: json['uId'] ?? 'No Uid',
      phoneNumber: json['phoneNumber'] ?? 'No Phone Number',
      nationalId: json['nationalId'] ?? 'No National ID',
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      email: userEntity.email,
      uId: userEntity.uId,
      phoneNumber: userEntity.phoneNumber,
      nationalId: userEntity.nationalId,
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      firstName: user.displayName?.split(' ').first ?? 'No Name',
      lastName: (user.displayName?.split(' ').length ?? 0) > 1
          ? user.displayName!.split(' ').sublist(1).join(' ')
          : '',
      email: user.email ?? 'No Email',
      uId: user.uid,
      phoneNumber: 'No Phone Number',
      nationalId: 'No National ID',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'uId': uId,
      'phoneNumber': phoneNumber,
      'nationalId': nationalId,
    };
  }
}
