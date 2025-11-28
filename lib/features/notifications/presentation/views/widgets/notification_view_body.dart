import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_card.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
      builder: (context, state) {
        if (state is GetNotificationsLoading ||
            state is GetNotificationsInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetNotificationsFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          );
        }

        if (state is GetNotificationsSuccess) {
          if (state.notifications.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noNotfi,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 70,
            ),
            physics: const BouncingScrollPhysics(),

            itemCount: state.notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return NotificationCard(notification: notification);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
