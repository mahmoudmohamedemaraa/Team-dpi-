import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 32.h,
          bottom: 32.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  text2,
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  text3,
                  style: TextStyle(color: AppTheme.darkGrey, fontSize: 14.sp),
                ),
                Text(
                  text4,
                  style: TextStyle(color: AppTheme.darkGrey, fontSize: 14.sp),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
                height: 100.h,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 0.5,
      shadowColor: AppTheme.black,
      color: AppTheme.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    );
  }
}
