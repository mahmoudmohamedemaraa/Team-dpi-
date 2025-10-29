import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';

class AddReportView extends StatelessWidget {
  const AddReportView({super.key});
  static const routeName = 'add_report';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: Text("تقديم بلاغ"),
      ),
    );
  }
}
