import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WidgetQuickOptions extends StatelessWidget {
  const WidgetQuickOptions({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: AppTheme.lightRed,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
