import 'dart:developer';

import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/widgets/custom_password_field.dart';
import 'package:depi_project/generated/l10n.dart';
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
                labelText: S.of(context).fristName,
                hintText: S.of(context).fristNameEx,
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  lastName = value!;
                },
                labelText: S.of(context).LastName,
                hintText: S.of(context).LastNameEx,
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  nationalId = value!;
                },
                labelText: S.of(context).nationalID,
                hintText: '29XXXXXXXXXXXX',
                obscureText: false,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enterNationalId;
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return S.of(context).nationalIdOnlyNums;
                  } else if (value.length != 14) {
                    return S.of(context).nationalIdAtleastNums;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  phoneNumber = value!;
                },
                labelText: S.of(context).phoneNumber,
                hintText: '01XXXXXXXXX',
                obscureText: false,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enterPhone ;
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return S.of(context).phoneNumberOnlyNums;
                  } else if (value.length != 11) {
                    return S.of(context).phoneNumber11;
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  email = value!;
                },
                labelText: S.of(context).email,
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
                text: S.of(context).creatingAccount,
                textColor: const Color.fromARGB(255, 11, 11, 11),
                gradientColors: AppTheme.primaryGradientColors,
                shadowColor: const Color.fromARGB(
                  255,
                  190,
                  122,
                  122,
                ).withOpacity(0.2),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Text(S.of(context).havingAccount),
                    SizedBox(height: 20),
                    CustomButton(
                      text: S.of(context).signIn,
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
                      textColor: const Color.fromARGB(255, 11, 11, 11),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
