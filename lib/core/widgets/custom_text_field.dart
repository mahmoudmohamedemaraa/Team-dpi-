import 'dart:ui';
import 'package:flutter/material.dart';

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
    // الحصول على مخطط الألوان ونصوص الثيم
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ⭐ labelText يستخدم bodyLarge من الثيم (يتغير لونه تلقائياً)
        Text(
          labelText,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(16), 
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: maxLines == 1 ? 55 : 55.0 * maxLines,
                  ),
                  // ⭐ استخدام ألوان الثيم للخلفية والحدود
                  decoration: BoxDecoration(
                    // surfaceVariant يستخدم كلون قريب من الخلفية مع شفافية
                    color: colorScheme.surfaceVariant.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      // outline يستخدم كلون للحدود
                      color: colorScheme.outline.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: validator ??
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
                // ⭐ نص الإدخال يستخدم bodyMedium من الثيم
                style: textTheme.bodyMedium?.copyWith(
                  // onSurface هو لون النص الأساسي في الثيم (أسود أو أبيض)
                  color: colorScheme.onSurface, 
                ), 
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  // ⭐ hintStyle يستخدم bodyMedium من الثيم مع شفافية
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
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