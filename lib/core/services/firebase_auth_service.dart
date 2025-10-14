import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Exception in FirebaseAuthService.deleteUser: ${e.toString()}');
      throw CustomException(
        message: 'حدث خطأ أثناء حذف الحساب. الرجاء المحاولة مرة أخرى.',
      );
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
        throw CustomException(
          message: 'الرقم السري او البريد الإلكتروني غير صحيح.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'الرقم السري او البريد الإلكتروني غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'فشل الاتصال بالشبكة. الرجاء التحقق من اتصالك بالإنترنت.',
        );
      } else {
        throw CustomException(
          message:
              'فشل تسجيل الدخول. الرجاء التحقق من البيانات والمحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exeption in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        message:
            'حدث خطأ غير معروف أثناء تسجيل الدخول. الرجاء المحاولة مرة أخرى.',
      );
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
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد تم استخدام هذا البريد الإلكتروني بالفعل.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'فشل الاتصال بالشبكة. الرجاء التحقق من اتصالك بالإنترنت.',
        );
      } else {
        throw CustomException(
          message: 'لم يتم إنشاء الحساب بنجاح. الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );

      throw CustomException(
        message:
            'حدث خطأ غير معروف أثناء إنشاء الحساب. الرجاء المحاولة مرة أخرى.',
      );
    }
  }

  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
