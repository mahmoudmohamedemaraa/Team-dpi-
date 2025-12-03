import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Exception in FirebaseAuthService.deleteUser: ${e.toString()}');
      throw CustomException(message: 'DELETE_ACCOUNT_ERROR');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'INCORRECT_EMAIL_OR_PASSWORD');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'INCORRECT_EMAIL_OR_PASSWORD');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'NETWORK_CONNECTION_FAILED');
      } else {
        throw CustomException(message: 'SIGN_IN_FAILED');
      }
    } catch (e) {
      log(
        'Exeption in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'UNKNOWN_SIGN_IN_ERROR');
    }
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'WEAK_PASSWORD');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'EMAIL_ALREADY_IN_USE');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'NETWORK_CONNECTION_FAILED');
      } else {
        throw CustomException(message: 'ACCOUNT_CREATION_FAILED');
      }
    } catch (e) {
      log(
        'Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );

      throw CustomException(message: 'UNKNOWN_ACCOUNT_CREATION_ERROR');
    }
  }

  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log('Exception in FirebaseAuthService.signOut: ${e.toString()}');
      throw CustomException(message: 'SIGN_OUT_ERROR');
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in sendPasswordResetEmail: ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'USER_NOT_FOUND');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'INVALID_EMAIL');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'NETWORK_CONNECTION_FAILED');
      } else {
        throw CustomException(message: 'PASSWORD_RESET_FAILED');
      }
    } catch (e) {
      log('Exception in sendPasswordResetEmail: ${e.toString()}');
      throw CustomException(message: 'UNKNOWN_ERROR');
    }
  }
}
