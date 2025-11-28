import 'package:depi_project/app_theme.dart';
import 'package:depi_project/features/emergency_numbers/presentation/views/emergency_numbers_body.dart';
import 'package:depi_project/features/from_home_to_page/security_tips_page/presentation/security_tips_page.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../reports/presentation/views/repports_body.dart';

class WidgetQuickOptions extends StatelessWidget {
  const WidgetQuickOptions({
    super.key,
    required this.icon,
    required this.text,
    // this.onTap,
  });
  final IconData icon;
  final String text;
  //final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == S.of(context).emergencyNumbers) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EmergencyNumbersBody(),
            ),
          );
        } else if (text == S.of(context).securityTips) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => SecurityTipsPage()));
        } else if (text == S.of(context).myReports) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => RepportsBody()));
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.22,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon, size: 35, color: AppTheme.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
