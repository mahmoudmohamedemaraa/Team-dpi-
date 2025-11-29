import 'package:flutter/material.dart';

import '../enums/report_status_enums.dart';
import '../../generated/l10n.dart';

Color getStatusColor(ReportStatusEnum status) {
  switch (status) {
    case ReportStatusEnum.pending:
      return Colors.orange;
    case ReportStatusEnum.inReview:
      return Colors.blue;
    case ReportStatusEnum.investigating:
      return Colors.purple;
    case ReportStatusEnum.resolved:
      return Colors.green;
    case ReportStatusEnum.rejected:
      return Colors.red;
  }
}

String getStatusText(BuildContext context, ReportStatusEnum status) {
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

String statusToString(ReportStatusEnum status) {
  switch (status) {
    case ReportStatusEnum.pending:
      return 'pending';
    case ReportStatusEnum.inReview:
      return 'inReview';
    case ReportStatusEnum.investigating:
      return 'investigating';
    case ReportStatusEnum.resolved:
      return 'resolved';
    case ReportStatusEnum.rejected:
      return 'rejected';
  }
}
