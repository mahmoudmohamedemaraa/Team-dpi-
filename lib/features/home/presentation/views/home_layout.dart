import 'dart:developer';

import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/features/add_report/presentation/views/add_report_view.dart';
import 'package:depi_project/features/from_home_to_page/security_tips_page/presentation/security_tips_page.dart';
import 'package:depi_project/features/profile/presentation/views/profile_view.dart';
import 'package:depi_project/features/home/presentation/views/widgets/home_widget/widget_awareness_card.dart';
import 'package:depi_project/features/home/presentation/views/widgets/home_widget/widget_quick_options.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../reports/presentation/views/repports_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppTheme.grey,
                        radius: 30.r,
                        child: Icon(
                          Icons.person,
                          size: 30.sp,
                          color: AppTheme.lightGrey,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      GestureDetector(
                        onTap: () {
                          log("Navigating to Profile Page");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProfileView(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).greeting,
                              style: TextStyle(
                                color: AppTheme.darkGrey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${getUser().firstName} ${getUser().lastName}",
                              maxLines: 1,
                              style: TextStyle(
                                color: AppTheme.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        "assets/images/police.jpg",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12.h,
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: AppTheme.darkGrey,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AddReportView.routeName);
                              },
                              child: Icon(
                                Icons.add_box,
                                color: AppTheme.white,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.85),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                              spacing: 6.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).reportButtonTitle,
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  S.of(context).reportButtonDiscription,
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  S.of(context).reportButtonDiscriptionContinue,
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                S.of(context).quickOptions,
                style: TextStyle(
                  color: AppTheme.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      log("Navigating to RepportsBody");
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RepportsBody()),
                      );
                    },
                    child: WidgetQuickOptions(
                      icon: Icons.receipt_long,
                      text: S.of(context).myReports,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SecurityTipsPage(),
                        ),
                      );
                    },
                    child: WidgetQuickOptions(
                      icon: Icons.security,
                      text: S.of(context).securityTips,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  WidgetQuickOptions(
                    icon: Icons.phone,
                    text: S.of(context).emergencyNumbers,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              WidgetAwarenessCard(
                text1: S.of(context).ministryAwareness,
                text2: S.of(context).cyberFraudWarning,
                text3: S.of(context).cyberFraudWarningContinue,
                imageUrl: "assets/images/security.jpg",
                text4: S.of(context).cyberFraudWarningContinue2,
              ),
              SizedBox(height: 16.h),
              WidgetAwarenessCard(
                text1: S.of(context).ministryAwareness,
                text2: S.of(context).reportingCybercrimes,
                text3: S.of(context).cyberFraudWarningContinue3,
                imageUrl: "assets/images/computer2.jpg",
                text4: S.of(context).cyberFraudWarningContinue4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
