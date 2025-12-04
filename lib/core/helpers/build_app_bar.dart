import 'package:depi_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {required String title, Gradient? gradient}) {
  // 1. تحديد ما إذا كانت السمة الحالية هي الوضع الداكن
  final isDark = Theme.of(context).brightness == Brightness.dark;
  
  // 2. تحديد لون النص والأيقونات بناءً على وجود التدرج اللوني أو السمة
  final Color titleAndIconColor = gradient != null
      ? Colors.white
      : isDark
          ? Theme.of(context).colorScheme.onSurface
          : AppTheme.primaryColor;  

  // 3. تحديد لون الخلفية
  final Color appBarBackgroundColor = gradient != null 
      ? Colors.transparent 
      : Theme.of(context).scaffoldBackgroundColor;
  
  return AppBar(
    backgroundColor: appBarBackgroundColor,
    flexibleSpace: gradient != null
        ? Container(decoration: BoxDecoration(gradient: gradient))
        : null,
    
    title: Text(
      title,
      style: TextStyle(
        color: titleAndIconColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    centerTitle: true,
    
    iconTheme: IconThemeData(
      color: titleAndIconColor, 
    ),
  );
}
