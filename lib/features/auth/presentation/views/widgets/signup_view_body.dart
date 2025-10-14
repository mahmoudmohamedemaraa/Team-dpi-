import 'dart:developer';

import 'package:depi_project/core/widgets/custom_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../domain/entities/user_entity.dart';
import '../../manager/cubits/signup_cubit/signup_cubit.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, firstName, lastName, password, nationalId, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 50),
              CustomTextField(
                onSaved: (value) {
                  firstName = value!;
                },
                labelText: 'الاسم الاول',
                hintText: 'محمد',
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  lastName = value!;
                },
                labelText: 'الاسم الاخير',
                hintText: 'احمد',
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  nationalId = value!;
                },
                labelText: 'الرقم القومي',
                hintText: '29XXXXXXXXXXXX',
                obscureText: false,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء إدخال الرقم القومي';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'الرقم القومي يجب أن يحتوي على أرقام فقط';
                  } else if (value.length != 14) {
                    return 'الرقم القومي يجب أن يتكون من 14 رقمًا';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  phoneNumber = value!;
                },
                labelText: 'رقم الهاتف',
                hintText: '01XXXXXXXXX',
                obscureText: false,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء إدخال رقم الهاتف';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';
                  } else if (value.length != 11) {
                    return 'رقم الهاتف يجب أن يتكون من 11 رقمًا';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  email = value!;
                },
                labelText: 'البريد الالكتروني',
                hintText: 'example@mail.com',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 40),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log(
                      'email: $email password: $password  firstName: $firstName  lastName: $lastName phoneNumber: $phoneNumber nationalId: $nationalId',
                    );
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                      UserEntity(
                        email: email,
                        firstName: firstName,
                        lastName: lastName,
                        phoneNumber: phoneNumber,
                        nationalId: nationalId,
                        uId: '',
                      ),
                      password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: ' انشاء حساب',
                gradientColors: [
                  const Color(0xffDB3022),
                  Color(0xFFFF9A8B),
                  const Color(0xffDB3022),
                ],
                shadowColor: const Color(0xFFFF7F37).withOpacity(0.4),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Text(' لديك حساب؟'),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'تسجيل الدخول',
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
