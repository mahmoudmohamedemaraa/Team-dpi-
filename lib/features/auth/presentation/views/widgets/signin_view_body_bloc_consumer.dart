import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:depi_project/app_theme.dart';
import 'package:depi_project/features/home/presentation/views/main_screen.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/build_snack_bar.dart';
import '../../../../../core/helpers/error_message_helper.dart';
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
            title: S.of(context).signIn,
            message: S.of(context).signInSuccess,
            contentType: ContentType.success,
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false,
          );
        }
        if (state is SigninFailure) {
          buildSnackBar(
            context: context,
            title: S.of(context).notSignedIn,
            message: getErrorMessage(context, state.errorMessage),
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninLoading ? true : false,
          progressIndicator: CircularProgressIndicator(
            color: AppTheme.primaryColor,
          ),
          child: SigninViewBody(),
        );
      },
    );
  }
}
