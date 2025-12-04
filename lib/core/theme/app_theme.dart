import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFDD3F34);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF34383B);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const lightRed = Color(0xFFFAD1CF);
  static const Color grey = Color(0xE0E0E0E0);
  static const darkGrey = Color(0xfff9e9e9e);
  static const Color vibrantDarkRed = Color(0xFFEA6D79);
  static const primaryGradientColors = [
    Color(0xffDB3022),
    Color(0xFFFF9A8B),
    Color(0xffDB3022),
  ];
  static final Color primaryShadowColor = const Color(
    0xFFFF7F37,
  ).withOpacity(0.4);
static const darkBackground = Color.fromARGB(255, 34, 33, 33);
  static const darkSurface = Color.fromARGB(255, 38, 41, 43);
  //

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: white,
    brightness: Brightness.light,

    // مخطط الألوان (ColorScheme) - ضروري لعمل الـ Themes
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onSurface: black, // لون النص الأساسي للأيقونات والـ Labels
      surfaceVariant: const Color.fromARGB(255, 225, 223, 223), // لون خلفية حقول الإدخال
    ),

//(Appbar Theme)
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      foregroundColor: primaryColor,

    ),

    //(BottomNavigationBarTheme) 
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primaryColor,
      unselectedItemColor: lightGrey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),

    // (TextTheme)Labelـ Hint*
    textTheme: TextTheme(
      // BodyLarge للـ labelText (مثل عنوان الحقل)
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: black,
      ),
      // BodyMedium لنص الإدخال الفعلي والـ hintText
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );

  //  (Dark Theme)
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackground,
    brightness: Brightness.dark,

    // مخطط الألوان (ColorScheme)
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: const Color.fromARGB(255, 20, 18, 18),
      onSurface: white, // لون النص الأساسي للأيقونات والـ Labels
      surface: lightGrey,
      surfaceVariant: darkGrey,
       // لون خلفية حقول الإدخال
    ),

    // (AppBar)
    appBarTheme: AppBarTheme(
      backgroundColor: darkSurface,
      foregroundColor: white,
    ),

    //  (BottomNavigationBarTheme) 
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkSurface,
      selectedItemColor: primaryColor,
      unselectedItemColor: white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),

    // (TextTheme)  Label = Hint
    textTheme: TextTheme(
      // BodyLarge للـ labelText (مثل عنوان الحقل)
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: white,
      ),
      // BodyMedium لنص الإدخال الفعلي والـ hintText
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: white,
      ),
    ),

  );
}