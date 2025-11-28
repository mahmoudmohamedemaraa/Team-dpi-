import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/core/widgets/custom_password_field.dart';
import 'package:depi_project/features/auth/presentation/views/signup_view.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/cubits/signin_cubit/signin_cubit.dart';
import '../reset_password_view.dart';

class SigninViewBody extends StatelessWidget {
  SigninViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String emailOrNationalId;
  late String password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 290),
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
                hintText: 'example@mail.com',
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ResetPasswordView.routeName);
                    },
                    child: Text(
                      S.of(context).forgetPassword,
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signIn(
                      emailOrNationalId,
                      password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                text: S.of(context).signIn,
                gradientColors: AppTheme.primaryGradientColors,
                shadowColor: AppTheme.primaryShadowColor,
              ),
              SizedBox(height: 180),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
                child: Column(
                  children: [
                    Text(S.of(context).do_notHaveAccount),
                    SizedBox(height: 15),
                    CustomButton(
                      text: S.of(context).creatingAccount,
                      gradientColors: [
                        const Color.fromARGB(130, 228, 222, 222),
                        const Color.fromARGB(130, 239, 191, 191),
                        const Color.fromARGB(130, 228, 222, 222),
                      ],
                      shadowColor: const Color.fromARGB(
                        255,
                        231,
                        124,
                        124,
                      ).withOpacity(0.5),

                      borderWidth: 1.5,
                      hasShadow: false,
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
