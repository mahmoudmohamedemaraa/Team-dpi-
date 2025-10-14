import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/core/widgets/custom_password_field.dart';
import 'package:depi_project/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/cubits/signin_cubit/signin_cubit.dart';

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
              SizedBox(height: 247),
              CustomTextField(
                onSaved: (value) {
                  emailOrNationalId = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء إدخال البريد الإلكتروني أو الرقم القومي';
                  } else if (!value.contains('@') &&
                      !RegExp(r'^\d+$').hasMatch(value)) {
                    return 'برجاء إدخال بريد إلكتروني صالح أو رقم قومي صحيح';
                  }
                  return null;
                },
                labelText: ' البريد الالكتروني او الرقم القومي',
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
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('نسيت كلمة المرور؟')],
              ),
              SizedBox(height: 28),
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
                text: 'تسجيل الدخول',
                gradientColors: [
                  const Color(0xffDB3022),
                  Color(0xFFFF9A8B),
                  const Color(0xffDB3022),
                ],
                shadowColor: const Color(0xFFFF7F37).withOpacity(0.4),
              ),
              SizedBox(height: 152),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
                child: Column(
                  children: [
                    Text('ليس لديك حساب؟'),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'انشاء حساب',
                      backgroundColor: Colors.white.withValues(alpha: 0.10),

                      borderWidth: 1.5,
                      hasShadow: false,
                      textColor: Colors.white,
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
