import 'package:dartz/dartz.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/errors/failures.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/database_service.dart';
import 'package:depi_project/core/utils/backend_endpoint.dart';
import 'package:depi_project/features/notifications/data/models/report_notification_model.dart';
import 'package:depi_project/features/notifications/domain/entities/report_notification_entity.dart';
import '../../domain/repos/notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final DatabaseService databaseService;

  NotificationsRepoImpl(this.databaseService);

  @override
  Stream<Either<Failure, List<ReportNotificationEntity>>> getUserNotifications(
    String userId,
  ) async* {
    try {
      // Get current user from helper
      final currentUser = getUser();

      await for (final data in databaseService.streamCollection(
        path: BackendEndpoint.getNotifications,
      )) {
        // Filter notifications for the current user and convert to entities
        final notifications = data
            .where((e) => e['userId'] == currentUser.uId)
            .map<ReportNotificationEntity>(
              (e) => ReportNotificationModel.fromJson(e).toEntity(),
            )
            .toList();

        // Sort by timestamp (newest first)
        notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));

        yield Right(notifications);
      }
    } catch (e) {
      yield Left(ServerFailure('لا يمكن جلب الإشعارات'));
    }
  }

  @override
  Future<Either<Failure, void>> markNotificationAsRead(
    String notificationId,
  ) async {
    if (notificationId.isEmpty) {
      return Left(ServerFailure('معرف الإشعار غير صالح'));
    }

    try {
      await databaseService.updateData(
        path: BackendEndpoint.getNotifications,
        documentId: notificationId,
        data: {'isRead': true},
      );
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure('تعذر تحديث حالة الإشعار'));
    }
  }

  @override
  Future<Either<Failure, ReportEntity>> getReportById(String reportId) async {
    try {
      final data = await databaseService.getData(
        path: BackendEndpoint.addReports,
        documentId: reportId,
      );

      if (data == null) {
        return Left(ServerFailure('البلاغ غير موجود'));
      }

      final map = Map<String, dynamic>.from(data as Map<String, dynamic>);
      return Right(ReportEntity.fromJson(map));
    } catch (_) {
      return Left(ServerFailure('تعذر تحميل بيانات البلاغ'));
    }
  }
}
