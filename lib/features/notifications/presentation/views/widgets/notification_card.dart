import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final formattedDate = formatDateTime(
      notification.timestamp.toLocal(),
      context,
    );
    final statusColor = getStatusColor(notification.status);
    final statusLabel = getStatusText(context, notification.status);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () => handleTap(context),
        child: Container(
          decoration: BoxDecoration(
            color: notification.isRead ? AppTheme.lightGrey : AppTheme.lightRed,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppTheme.primaryColor.withOpacity(0.1)),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      notification.getLocalizedTitle(context),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  if (!notification.isRead) SizedBox(width: 8.w),
                  if (!notification.isRead)
                    CircleAvatar(
                      radius: 5.r,
                      backgroundColor: AppTheme.primaryColor,
                    ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                notification.getLocalizedMessage(context),
                style: TextStyle(fontSize: 14.sp, color: AppTheme.black),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Chip(
                    label: Text(statusLabel),
                    backgroundColor: statusColor.withOpacity(0.15),
                    labelStyle: TextStyle(
                      color: statusColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                  ),
                  const Spacer(),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
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
