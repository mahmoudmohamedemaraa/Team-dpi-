import 'package:flutter/material.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';
import '../../../../generated/l10n.dart';

class ReportNotificationEntity {
  final String id;
  final String reportId;
  final String userId;
  final String title;
  final String message;
  final ReportStatusEnum status;
  final DateTime timestamp;
  final bool isRead;

  const ReportNotificationEntity({
    required this.id,
    required this.reportId,
    required this.userId,
    required this.title,
    required this.message,
    required this.status,
    required this.timestamp,
    this.isRead = false,
  });

  // Get localized title
  String getLocalizedTitle(BuildContext context) {
    return S.of(context).reportStatusUpdated;
  }

  // Get localized message with status
  String getLocalizedMessage(BuildContext context) {
    final statusText = _getStatusText(context);
    return '${S.of(context).reportStatusChangedTo} $statusText';
  }

  String _getStatusText(BuildContext context) {
    switch (status) {
      case ReportStatusEnum.pending:
        return S.of(context).statusPending;
      case ReportStatusEnum.inReview:
        return S.of(context).statusInReview;
      case ReportStatusEnum.investigating:
        return S.of(context).statusInvestigating;
      case ReportStatusEnum.resolved:
        return S.of(context).statusResolved;
      case ReportStatusEnum.rejected:
        return S.of(context).statusRejected;
    }
  }

  // Copy with method to create a modified copy of the entity
  ReportNotificationEntity copyWith({
    String? id,
    String? reportId,
    String? userId,
    String? title,
    String? message,
    ReportStatusEnum? status,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return ReportNotificationEntity(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
