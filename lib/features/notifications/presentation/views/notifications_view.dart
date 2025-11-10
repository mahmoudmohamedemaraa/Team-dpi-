import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/features/notifications/domain/repos/notifications_repo.dart';
import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/notification_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key, this.provideCubit = true});

  final bool provideCubit;

  @override
  Widget build(BuildContext context) {
    final view = Scaffold(
      backgroundColor: AppTheme.white,
      appBar: buildAppBar(title: 'الاشعارات'),
      body: const NotificationsViewBody(),
    );

    if (!provideCubit) {
      return view;
    }

    return BlocProvider<GetNotificationsCubit>(
      create: (_) =>
          GetNotificationsCubit(getIt.get<NotificationsRepo>())
            ..getUserNotifications(getUser().uId),
      child: view,
    );
  }
}
