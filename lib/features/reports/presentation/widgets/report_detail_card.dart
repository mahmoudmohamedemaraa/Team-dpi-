
import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';
import 'package:depi_project/features/reports/presentation/widgets/report_details_screen.dart';
import 'package:flutter/material.dart';

class ReportDetailCard extends StatelessWidget {
  final ReportEntity data;
  const ReportDetailCard({
    super.key,
    required this.data
    });

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
        margin: const EdgeInsets.all(8),
        elevation: 2,
        shadowColor: AppTheme.black,
        color: AppTheme.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.title,
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Chip(
                    label: Text(
                      data.statusDisplayName,
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor:getReportStatusColor(data.status) ,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 0,
                    )
                  ),
                  
                ],
              ),
              const SizedBox(height: 8),
              Text(
                data.description,
                style: TextStyle(
                  color: AppTheme.black,
                  fontSize: 12,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (data.address != null && data.address!.isNotEmpty)
                 Row(
                  children: [
                    Icon(
                      Icons.location_on,
                       size: 16,
                       color: AppTheme.darkGrey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        data.address!,
                        style: TextStyle(
                          color: AppTheme.darkGrey,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                 ) ,
                 const SizedBox(height: 8),
                 Text('تاريخ البلاغ : ${data.createdAt.day}/${data.createdAt.month}/${data.createdAt.year} ',
                  style: TextStyle(
                    color: AppTheme.darkGrey,
                    fontSize: 10,
                  ),
                 ),
      
                
              
      
            ],
          ),
        ),
      
      ),
    );
  }
}