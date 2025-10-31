import 'dart:io';

import '../enums/report_status_enums.dart';
import '../entities/report_entity.dart';
import '../helpers/status_from_string.dart';

class ReportModel extends ReportEntity {
  final List<File> mediaFiles;

  ReportModel({
    required super.reportId,
    required super.title,
    required super.userId,
    required super.description,
    required super.mediaUrls,
    required super.createdAt,
    super.address,
    required super.updatedAt,
    super.status = ReportStatusEnum.pending,
    required this.mediaFiles,
  });

  /// Convert ReportModel to Map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'reportId': reportId,
      'title': title,
      'description': description,
      'userId': userId,
      'mediaUrls': mediaUrls,
      'createdAt': createdAt.toIso8601String(),
      'address': address,
      'updatedAt': updatedAt.toIso8601String(),
      'status': status.name,
    };
  }

  /// Create ReportModel from Firestore Map
  factory ReportModel.fromJson(Map<String, dynamic> map) {
    return ReportModel(
      reportId: map['reportId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      userId: map['userId'] ?? '',
      mediaUrls: List<String>.from(map['mediaUrls'] ?? []),
      createdAt: DateTime.parse(map['createdAt']),
      address: map['address'],
      updatedAt: DateTime.parse(map['updatedAt']),
      status: statusFromString(map['status']),
      mediaFiles: [],
    );
  }

  /// Create ReportModel from ReportEntity
  factory ReportModel.fromEntity(
    ReportEntity entity, {
    List<File>? mediaFiles,
  }) {
    return ReportModel(
      reportId: entity.reportId,
      title: entity.title,
      description: entity.description,
      userId: entity.userId,
      mediaUrls: entity.mediaUrls,
      createdAt: entity.createdAt,
      address: entity.address,
      updatedAt: entity.updatedAt,
      status: entity.status,
      mediaFiles: mediaFiles ?? [],
    );
  }

  ReportEntity toEntity() {
    return ReportEntity(
      reportId: reportId,
      title: title,
      description: description,
      userId: userId,
      mediaUrls: mediaUrls,
      createdAt: createdAt,
      address: address,
      updatedAt: updatedAt,
      status: status,
    );
  }
}
