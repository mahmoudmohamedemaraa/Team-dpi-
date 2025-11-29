import 'package:flutter/material.dart';
import '../enums/report_status_enums.dart';
import '../helpers/format_date_time.dart';
import '../../generated/l10n.dart';

class ReportEntity {
  final String reportId;
  final String title;
  final String description;
  final String userId;
  final List<String> mediaUrls;
  final DateTime createdAt;
  final String? address;
  final DateTime updatedAt;
  final ReportStatusEnum status;

  final String? adminComment;
  ReportEntity({
    required this.reportId,

    required this.title,
    required this.userId,
    required this.description,
    required this.mediaUrls,
    required this.createdAt,
    this.address,
    required this.updatedAt,
    this.status = ReportStatusEnum.pending,
    this.adminComment,
  });

  factory ReportEntity.fromJson(Map<String, dynamic> json) {
    return ReportEntity(
      reportId: json['reportId'],
      title: json['title'],
      userId: json['userId'],
      description: json['description'],
      mediaUrls: List<String>.from(json['mediaUrls']),
      createdAt: parseDateTime(json['createdAt']),
      address: json['address'],
      updatedAt: parseDateTime(json['updatedAt']),
      status: ReportStatusEnum.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ReportStatusEnum.pending,
      ),
      adminComment: json['adminComment'],
    );
  }

  /// Copy with method for updating fields
  ReportEntity copyWith({
    String? reportId,
    String? title,
    String? description,
    String? userId,
    List<String>? mediaUrls,
    DateTime? createdAt,
    String? address,
    DateTime? updatedAt,
    ReportStatusEnum? status,
    String? adminComment,
  }) {
    return ReportEntity(
      reportId: reportId ?? this.reportId,
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      createdAt: createdAt ?? this.createdAt,
      address: address ?? this.address,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      adminComment: adminComment ?? this.adminComment,
    );
  }

  /// Get status display name with localization
  String getStatusDisplayName(BuildContext context) {
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
}
