import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFDD3F34);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF34383B);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const lightRed = Color(0xFFFAD1CF);
  static const Color grey = Color(0xE0E0E0E0);
  static const darkGrey = Color(0xFFF9E9E9E);
  static const primaryGradientColors = [
    Color(0xffDB3022),
    Color(0xFFFF9A8B),
    Color(0xffDB3022),
  ];
  static final Color primaryShadowColor = const Color(
    0xFFFF7F37,
  ).withOpacity(0.4);

  //

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primaryColor,
      unselectedItemColor: lightGrey,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.only(top: 8),
      ),
    ),
  );

  // dark theme

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: black,
      selectedItemColor: primaryColor,
      unselectedItemColor: white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: white,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.only(top: 8),
      ),
    ),
  );
}
