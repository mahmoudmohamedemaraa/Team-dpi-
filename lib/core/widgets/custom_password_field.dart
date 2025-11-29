import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).enteringPassword;
        }
        return null;
      },
      labelText: S.of(context).password,
      hintText: '********',
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscured,
      onSaved: (value) {
        widget.onSaved!(value);
      },
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscured = !isObscured;
          });
        },
        child: isObscured
            ? const Icon(Icons.remove_red_eye, color: Color(0xffc9cecf))
            : const Icon(Icons.visibility_off, color: Color(0xffc9cecf)),
      ),
    );
  }
}
