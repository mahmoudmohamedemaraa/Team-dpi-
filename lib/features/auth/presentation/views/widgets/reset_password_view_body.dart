import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/core/widgets/custom_text_field.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/cubits/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String emailOrNationalId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),
              Text(
                S.of(context).resetPassword,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.black,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                S.of(context).SendingEmailForNewPassword,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                onSaved: (value) {
                  emailOrNationalId = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enterEmailOrId;
                  } else if (!value.contains('@') &&
                      !RegExp(r'^\d+$').hasMatch(value)) {
                    return S.of(context).validEmailOrId;
                  }
                  return null;
                },
                labelText: S.of(context).emailOrId,
                hintText: 'example@mail.com ',
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 30.h),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<ResetPasswordCubit>().resetPassword(
                      emailOrNationalId,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                text: S.of(context).sendingLinkReset,
                gradientColors: AppTheme.primaryGradientColors,
                shadowColor: AppTheme.primaryShadowColor,
              ),
              SizedBox(height: 20.h),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).backSignIn,
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
