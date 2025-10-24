import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';

class RepportsBody extends StatelessWidget {
  const RepportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: Text("بلاغاتي"),
      ),
    );
  }
}