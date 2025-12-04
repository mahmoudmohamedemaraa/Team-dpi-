import 'package:depi_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'reset_password_view_body.dart';

class ResetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ResetPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني',
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
          Navigator.pop(context);
        }

        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppTheme.primaryColor,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        //  تم التغيير من color: Colors.white إلى لون الخلفية الديناميكي
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
          color: Theme.of(context).scaffoldBackgroundColor, 
          opacity: 0.7, // ترك الشفافية كما هي
          child: const ResetPasswordViewBody(),
        );
      },
    );
  }
}

class ModalProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget child;

  const ModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.grey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Stack(
      children: [
        child,
        if (inAsyncCall)
          Opacity(
            opacity: opacity,
            // color هنا هو اللون الذي تم تمريره ديناميكياً من الباني
            child: ModalBarrier(dismissible: false, color: color), 
          ),
        if (inAsyncCall)
          Center(
            child: CircularProgressIndicator(color: primaryColor),
          ),
      ],
    );
  }
}
