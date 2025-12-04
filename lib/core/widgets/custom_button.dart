import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.gradientColors,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.height = 54,
    this.borderRadius = 999,
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
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double borderRadius;
  final bool hasShadow;
  final Color? shadowColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null && borderWidth != null
            ? Border.all(color: borderColor!, width: borderWidth!)
            : null,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: (shadowColor ?? backgroundColor ?? Colors.grey)
                      .withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
