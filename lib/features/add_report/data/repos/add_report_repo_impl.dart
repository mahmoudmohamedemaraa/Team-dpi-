import 'package:dartz/dartz.dart';

import 'package:depi_project/core/entities/report_entity.dart';

import 'package:depi_project/core/errors/failures.dart';
import 'package:depi_project/core/models/report_model.dart';

import '../../../../core/services/database_service.dart';
import '../../../../core/utils/backend_endpoint.dart';
import '../../domain/repos/add_report_repo.dart';

class AddReportRepoImpl implements AddReportRepo {
  final DatabaseService databaseService;

  AddReportRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addReport(ReportEntity report) async {
    try {
      await databaseService.addData(
        documentId: report.reportId,
        path: BackendEndpoint.addReports,
        data: ReportModel.fromEntity(report).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add report: $e'));
    }
  }
}
