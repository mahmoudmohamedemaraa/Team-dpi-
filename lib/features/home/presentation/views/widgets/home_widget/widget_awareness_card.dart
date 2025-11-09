import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetAwarenessCard extends StatelessWidget {
  const WidgetAwarenessCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,

    required this.imageUrl,
  });
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
          bottom: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(color: AppTheme.primaryColor, fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  text2,
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  text3,
                  style: TextStyle(color: AppTheme.darkGrey, fontSize: 14),
                ),
                Text(
                  text4,
                  style: TextStyle(color: AppTheme.darkGrey, fontSize: 14),
                ),
              ],
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      elevation: 0.5,
      shadowColor: AppTheme.black,
      color: AppTheme.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
