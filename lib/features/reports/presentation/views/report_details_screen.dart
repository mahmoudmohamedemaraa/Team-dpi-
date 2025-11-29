import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:depi_project/features/reports/presentation/widgets/media_thumbnail.dart';
import 'package:depi_project/generated/l10n.dart';

class ReportDetailsScreen extends StatelessWidget {
  final ReportEntity report;

  const ReportDetailsScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    Color getReportStatusColor(ReportStatusEnum status) {
      switch (status) {
        case ReportStatusEnum.pending:
          return Colors.blueGrey.shade500;
        case ReportStatusEnum.inReview:
          return Colors.amber.shade700;
        case ReportStatusEnum.investigating:
          return Colors.orange.shade700;
        case ReportStatusEnum.resolved:
          return Colors.green.shade600;
        case ReportStatusEnum.rejected:
          return Colors.red.shade600;
      }
    }

    return Scaffold(
      appBar: buildAppBar(title: S.of(context).reportDetails),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.black,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Text(
                  '${S.of(context).status}:',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    report.statusDisplayName,
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: getReportStatusColor(report.status),
                ),
              ],
            ),
            const Divider(height: 32),

            Text(
              '${S.of(context).description}:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(report.description, style: const TextStyle(fontSize: 16)),
            const Divider(height: 32),

            if (report.address != null && report.address!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).address}:',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppTheme.darkGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          report.address!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                ],
              ),

            // (Media)
            if (report.mediaUrls.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).media}:',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: report.mediaUrls.length > 4
                          ? 4
                          : report.mediaUrls.length,
                      itemBuilder: (context, index) {
                        final url = report.mediaUrls[index];
                        final showMore =
                            index == 3 && report.mediaUrls.length > 4;
                        final remaining = showMore
                            ? report.mediaUrls.length - 4
                            : 0;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: MediaThumbnail(
                            mediaUrl: url,
                            showMoreIndicator: showMore,
                            remainingCount: remaining,
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 32),
                ],
              ),

            // (Admin Comment)
            if (report.adminComment != null && report.adminComment!.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.darkGrey.withOpacity(0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${S.of(context).adminComment}:',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        report.adminComment!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
