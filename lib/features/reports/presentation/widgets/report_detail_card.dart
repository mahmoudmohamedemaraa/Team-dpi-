import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';
import 'package:depi_project/features/reports/presentation/views/report_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDetailCard extends StatelessWidget {
  final ReportEntity data;
  const ReportDetailCard({super.key, required this.data});

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

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDetailsScreen(report: data),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.w),
        elevation: 2,
        shadowColor: AppTheme.black,
        color: AppTheme.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data.title,
                      style: TextStyle(
                        color: AppTheme.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Chip(
                    label: Text(
                      data.getStatusDisplayName(context),
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: getReportStatusColor(data.status),
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                data.description,
                style: TextStyle(color: AppTheme.black, fontSize: 12.sp),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              if (data.address != null && data.address!.isNotEmpty)
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.sp,
                      color: AppTheme.darkGrey,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        data.address!,
                        style: TextStyle(
                          color: AppTheme.darkGrey,
                          fontSize: 12.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 8.h),
              Text(
                '${S.of(context).reportDate} : ${data.createdAt.day}/${data.createdAt.month}/${data.createdAt.year} ',
                style: TextStyle(color: AppTheme.darkGrey, fontSize: 10.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
