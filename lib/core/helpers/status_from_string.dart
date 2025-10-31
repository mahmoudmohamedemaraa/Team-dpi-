import '../enums/report_status_enums.dart';

ReportStatusEnum statusFromString(String? statusString) {
  if (statusString == null) return ReportStatusEnum.pending;

  try {
    return ReportStatusEnum.values.firstWhere(
      (e) => e.name == statusString,
      orElse: () => ReportStatusEnum.pending,
    );
  } catch (e) {
    return ReportStatusEnum.pending;
  }
}
