import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/format_date_time.dart';
import 'package:depi_project/core/helpers/report_status_helper.dart';
import 'package:depi_project/features/notifications/domain/entities/report_notification_entity.dart';
import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:depi_project/features/reports/presentation/widgets/report_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return const Center(
              child: Text(
                'لا توجد إشعارات حالياً.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemCount: state.notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return _NotificationCard(notification: notification);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification});

  final ReportNotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    final formattedDate = formatDateTime(notification.timestamp.toLocal());
    final statusColor = getStatusColor(notification.status);
    final statusLabel = getStatusText(notification.status);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _handleTap(context),
        child: Container(
          decoration: BoxDecoration(
            color: notification.isRead ? AppTheme.lightGrey : AppTheme.lightRed,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primaryColor.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      notification.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  if (!notification.isRead) const SizedBox(width: 8),
                  if (!notification.isRead)
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: AppTheme.primaryColor,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                notification.message,
                style: const TextStyle(fontSize: 14, color: AppTheme.black),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Chip(
                    label: Text(statusLabel),
                    backgroundColor: statusColor.withOpacity(0.15),
                    labelStyle: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  const Spacer(),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleTap(BuildContext context) async {
    final cubit = context.read<GetNotificationsCubit>();

    try {
      final result = await cubit.openNotification(notification);
      if (!context.mounted) return;

      if (result.warning != null && result.warning!.isNotEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result.warning!)));
      }

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ReportDetailsScreen(report: result.report),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      final message = e.toString().replaceFirst('Exception: ', '').trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.isEmpty ? 'حدث خطأ غير متوقع' : message),
        ),
      );
    }
  }
}
