import 'package:depi_project/core/theme/app_theme.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // جلب نمط النص الرئيسي الديناميكي
    final textTheme = Theme.of(context).textTheme;
    // جلب اللون الأساسي (primaryColor) بشكل ديناميكي
    final primaryColor = Theme.of(context).primaryColor;


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Text(
                'إعادة تعيين كلمة المرور',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textTheme.titleMedium!.color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'أدخل بريدك الإلكتروني أو الرقم القومي وسنرسل لك رابط لإعادة تعيين كلمة المرور',
                style: TextStyle(
                  fontSize: 16,
                  color: textTheme.titleMedium!.color,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
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
                labelText: 'البريد الإلكتروني أو الرقم القومي',
                hintText: 'example@mail.com ',
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
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
                text: 'إرسال رابط إعادة التعيين',
                gradientColors: AppTheme.primaryGradientColors, 
                shadowColor: AppTheme.primaryShadowColor,
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'العودة لتسجيل الدخول',
                    style: TextStyle(
                      // 🛠️ التعديل الثالث: استخدام اللون الأساسي الديناميكي
                      color: primaryColor,
                      fontSize: 16,
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
