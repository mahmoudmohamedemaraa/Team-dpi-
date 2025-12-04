import 'package:depi_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import '../../../../../core/helpers/format_date_time.dart';
import '../../../../../core/helpers/report_status_helper.dart';
import '../../../../reports/presentation/views/report_details_screen.dart';
import '../../../domain/entities/report_notification_entity.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

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
        onTap: () => handleTap(context),
        child: Container(
          decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark 
         ? notification.isRead ? const Color.fromARGB(255, 38, 41, 43) : const Color.fromARGB(255, 230, 103, 96)
         : notification.isRead ? AppTheme.lightGrey : AppTheme.lightRed,
            // color: notification.isRead ? AppTheme.lightGrey : AppTheme.lightRed,
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface
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
                style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
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
                    style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface),
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

  Future<void> handleTap(BuildContext context) async {
    final cubit = context.read<GetNotificationsCubit>();

    final result = await cubit.handleNotificationTap(notification);
    if (!context.mounted) return;

    switch (result.action) {
      case NotificationTapAction.markedAsRead:
        break;

      case NotificationTapAction.openReport:
        if (result.report != null) {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ReportDetailsScreen(report: result.report!),
            ),
          );
        }
        break;

      case NotificationTapAction.error:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.errorMessage ?? 'حدث خطأ غير متوقع'),
            backgroundColor: Colors.red,
          ),
        );
        break;
    }
  }
}
