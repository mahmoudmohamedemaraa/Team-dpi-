import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';

import 'package:flutter/material.dart';

import 'widgets/notification_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: buildAppBar(title: 'الاشعارات'),
      body: const NotificationsViewBody(),
    );
  }
}
