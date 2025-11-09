import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/core/widgets/custom_password_field.dart';
import 'package:depi_project/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              SizedBox(height: 290),
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('نسيت كلمة المرور؟')],
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
                text: 'تسجيل الدخول',
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
                    Text('ليس لديك حساب؟'),
                    SizedBox(height: 15),
                    CustomButton(
                      text: 'انشاء حساب',
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
