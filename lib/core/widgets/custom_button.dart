import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.gradientColors,
    this.textColor = Colors.white,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.height,
    this.borderRadius,
    this.hasShadow = true,
    this.shadowColor,
    this.borderColor,
    this.borderWidth,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final Color textColor;
  final double? fontSize;
  final FontWeight fontWeight;
  final double? height;
  final double? borderRadius;
  final bool hasShadow;
  final Color? shadowColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height?.h ?? 54.h;
    final effectiveBorderRadius = borderRadius?.r ?? 999.r;
    final effectiveFontSize = fontSize?.sp ?? 18.sp;

    return Container(
      height: effectiveHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        border: borderColor != null && borderWidth != null
            ? Border.all(color: borderColor!, width: borderWidth!)
            : null,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: (shadowColor ?? backgroundColor ?? Colors.grey)
                      .withOpacity(0.3),
                  blurRadius: 25,
                  offset: const Offset(0, 20),
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: (shadowColor ?? backgroundColor ?? Colors.grey)
                      .withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 50),
                  spreadRadius: -60,
                ),
              ]
            : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
          ),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: effectiveFontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
