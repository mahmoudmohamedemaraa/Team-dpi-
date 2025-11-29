import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.black,
              ),
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Text(
                  '${S.of(context).status}:',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Chip(
                  label: Text(
                    report.getStatusDisplayName(context),
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: getReportStatusColor(report.status),
                ),
              ],
            ),
            Divider(height: 32.h),

            Text(
              '${S.of(context).description}:',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(report.description, style: TextStyle(fontSize: 16.sp)),
            Divider(height: 32.h),

            if (report.address != null && report.address!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).address}:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppTheme.darkGrey,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          report.address!,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 32.h),
                ],
              ),

            // (Media)
            if (report.mediaUrls.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).media}:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 100.h,
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
                          padding: EdgeInsets.only(right: 8.w),
                          child: MediaThumbnail(
                            mediaUrl: url,
                            showMoreIndicator: showMore,
                            remainingCount: remaining,
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(height: 32.h),
                ],
              ),

            // (Admin Comment)
            if (report.adminComment != null && report.adminComment!.isNotEmpty)
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppTheme.darkGrey.withOpacity(0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${S.of(context).adminComment}:',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        report.adminComment!,
                        style: TextStyle(fontSize: 16.sp),
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
