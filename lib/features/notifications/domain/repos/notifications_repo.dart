import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/report_notification_entity.dart';

abstract class NotificationsRepo {
  Stream<Either<Failure, List<ReportNotificationEntity>>> getUserNotifications(
    String userId,
  );
}
