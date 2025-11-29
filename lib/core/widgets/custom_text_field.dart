import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.maxLines = 1,
  });
  final String labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(labelText),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: maxLines == 1 ? 55.h : 55.h * maxLines,
                  ),
                  decoration: BoxDecoration(
                    // color: const Color.fromARGB(
                    //   255,
                    //   172,
                    //   170,
                    //   170,
                    // ).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: const Color.fromARGB(
                        255,
                        13,
                        13,
                        13,
                      ).withOpacity(0.12),
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator:
                    validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                onSaved: onSaved,
                keyboardType: keyboardType,
                obscureText: obscureText,
                maxLines: maxLines,
                style: const TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      13,
                      13,
                      13,
                    ).withOpacity(0.7),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
