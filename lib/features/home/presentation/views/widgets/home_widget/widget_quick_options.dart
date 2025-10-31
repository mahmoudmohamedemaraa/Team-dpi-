import 'package:depi_project/app_theme.dart';
import 'package:depi_project/features/emergency_numbers/presentation/views/emergency_numbers_body.dart';
import 'package:flutter/material.dart';

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
      onTap: (){
        if (text == " ارقام طوارئ") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EmergencyNumbersBody(),
          ),
        );
      } else {
        null;
      };
      },
      child: Container(
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
      ),
    );
  }
}
