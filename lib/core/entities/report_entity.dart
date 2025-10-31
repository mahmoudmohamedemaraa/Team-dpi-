import '../enums/report_status_enums.dart';

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
  });

  factory ReportEntity.fromJson(Map<String, dynamic> json) {
    return ReportEntity(
      reportId: json['reportId'],
      title: json['title'],
      userId: json['userId'],
      description: json['description'],
      mediaUrls: List<String>.from(json['mediaUrls']),
      createdAt: DateTime.parse(json['createdAt'].toDate().toString()),
      address: json['address'],
      updatedAt: DateTime.parse(json['updatedAt'].toDate().toString()),
      status: ReportStatusEnum.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ReportStatusEnum.pending,
      ),
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
    );
  }

  /// Get status display name in Arabic
  String get statusDisplayName {
    switch (status) {
      case ReportStatusEnum.pending:
        return 'قيد المراجعة';
      case ReportStatusEnum.inReview:
        return 'تحت المراجعة';
      case ReportStatusEnum.investigating:
        return 'جاري التحقيق';
      case ReportStatusEnum.resolved:
        return 'تم الحل';
      case ReportStatusEnum.rejected:
        return 'مرفوض';
    }
  }
}
