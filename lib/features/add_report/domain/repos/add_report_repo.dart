import 'package:dartz/dartz.dart';
import 'package:depi_project/core/entities/report_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class AddReportRepo {
  Future<Either<Failure, void>> addReport(ReportEntity report);
}
