import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: Text("الاعدادات"),
      ),
    );
  }
}