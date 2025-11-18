import 'package:dartz/dartz.dart';

import '../../../../core/entities/report_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/report_notification_entity.dart';

abstract class NotificationsRepo {
  Stream<Either<Failure, List<ReportNotificationEntity>>> getUserNotifications(
    String userId,
  );
  Future<Either<Failure, void>> markNotificationAsRead(String notificationId);
  Future<Either<Failure, ReportEntity>> getReportById(String reportId);
}
