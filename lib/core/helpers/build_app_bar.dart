import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar({required String title, Gradient? gradient}) {
  return AppBar(
    backgroundColor: gradient != null ? Colors.transparent : AppTheme.white,
    flexibleSpace: gradient != null
        ? Container(decoration: BoxDecoration(gradient: gradient))
        : null,
    title: Text(
      title,
      style: TextStyle(
        color: gradient != null ? Colors.white : AppTheme.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
      ),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: gradient != null ? Colors.white : AppTheme.primaryColor,
    ),
  );
}
