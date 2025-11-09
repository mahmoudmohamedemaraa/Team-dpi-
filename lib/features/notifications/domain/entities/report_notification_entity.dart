import 'package:depi_project/core/enums/report_status_enums.dart';

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
