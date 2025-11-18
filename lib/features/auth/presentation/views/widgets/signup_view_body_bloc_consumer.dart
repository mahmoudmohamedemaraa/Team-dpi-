import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:depi_project/features/home/presentation/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/build_snack_bar.dart';
import '../../manager/cubits/signup_cubit/signup_cubit.dart';
import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          buildSnackBar(
            context: context,
            title: 'تم التسجيل',
            message: 'تم التسجيل بنجاح',
            contentType: ContentType.success,
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false,
          );
        }
        if (state is SignupFailure) {
          buildSnackBar(
            context: context,
            title: 'فشل التسجيل',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
