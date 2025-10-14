import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/build_snackbar.dart';
import '../../manager/cubits/signin_cubit/signin_cubit.dart';
import 'signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          buildSnackBar(
            context: context,
            title: 'تم تسجيل الدخول',
            message: 'تم تسجيل الدخول بنجاح',
            contentType: ContentType.success,
          );
        }
        if (state is SigninFailure) {
          buildSnackBar(
            context: context,
            title: 'لم يتم تسجيل الدخول',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}
