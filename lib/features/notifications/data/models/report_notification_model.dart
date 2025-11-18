import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';

import '../../../../core/entities/report_entity.dart';
import '../../../../core/helpers/report_status_helper.dart';
import '../../domain/entities/report_notification_entity.dart';

class ReportNotificationModel {
  final String id;
  final String reportId;
  final String userId;
  final String title;
  final String message;
  final ReportStatusEnum status;
  final DateTime timestamp;
  final bool isRead;

  const ReportNotificationModel({
    required this.id,
    required this.reportId,
    required this.title,
    required this.userId,
    required this.message,
    required this.status,
    required this.timestamp,
    this.isRead = false,
  });

  factory ReportNotificationModel.fromJson(Map<String, dynamic> json) {
    return ReportNotificationModel(
      id: json['id'] ?? '',
      reportId: json['reportId'] ?? '',
      title: json['title'] ?? '',
      userId: json['userId'] ?? '',
      message: json['message'] ?? '',
      status: statusFromString(json['status']),
      timestamp: json['timestamp'] is Timestamp
          ? (json['timestamp'] as Timestamp).toDate()
          : DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false,
    );
  }

  factory ReportNotificationModel.fromEntity(ReportEntity reportEntity) {
    return ReportNotificationModel(
      id: '',
      reportId: reportEntity.reportId,
      userId: reportEntity.userId,
      title: 'تم تحديث حالة البلاغ',
      message:
          'تم تغيير حالة البلاغ الخاص بك إلى ${reportEntity.statusDisplayName}',
      status: reportEntity.status,
      timestamp: DateTime.now(),
      isRead: false,
    );
  }

  // Convert model to JSON (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'reportId': reportId,
      'title': title,
      'message': message,
      'userId': userId,
      'status': statusToString(status),
      'timestamp': Timestamp.fromDate(timestamp),
      'isRead': isRead,
    };
  }

  // Convert model to entity
  ReportNotificationEntity toEntity() {
    return ReportNotificationEntity(
      id: id,
      reportId: reportId,
      userId: userId,
      title: title,
      message: message,
      status: status,
      timestamp: timestamp,
      isRead: isRead,
    );
  }

  // Create a copy with updated fields
  ReportNotificationModel copyWith({
    String? id,
    String? reportId,
    String? userId,
    String? title,
    String? message,
    ReportStatusEnum? status,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return ReportNotificationModel(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
