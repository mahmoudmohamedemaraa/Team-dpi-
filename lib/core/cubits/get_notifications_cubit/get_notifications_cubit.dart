import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../features/notifications/domain/entities/report_notification_entity.dart';
import '../../../features/notifications/domain/repos/notifications_repo.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this.notificationsRepo)
    : super(GetNotificationsInitial());
  final NotificationsRepo notificationsRepo;
  StreamSubscription? streamSubscription;
  void getUserNotifications(String userId) {
    emit(GetNotificationsLoading());
    streamSubscription?.cancel();
    streamSubscription = notificationsRepo.getUserNotifications(userId).listen((
      either,
    ) {
      either.fold(
        (failure) {
          emit(GetNotificationsFailure(message: failure.message));
        },
        (notifications) {
          emit(GetNotificationsSuccess(notifications: notifications));
        },
      );
    });
  }

  Future<NotificationTapResult> handleNotificationTap(
    ReportNotificationEntity notification,
  ) async {
    if (!notification.isRead) {
      if (notification.id.isNotEmpty) {
        final markResult = await notificationsRepo.markNotificationAsRead(
          notification.id,
        );

        return markResult.fold(
          (failure) => NotificationTapResult.error(failure.message),
          (_) {
            final currentState = state;
            if (currentState is GetNotificationsSuccess) {
              final updatedNotifications = currentState.notifications
                  .map(
                    (item) => item.id == notification.id
                        ? item.copyWith(isRead: true)
                        : item,
                  )
                  .toList();
              emit(
                GetNotificationsSuccess(notifications: updatedNotifications),
              );
            }
            return const NotificationTapResult.markedAsRead();
          },
        );
      }
      return const NotificationTapResult.markedAsRead();
    }

    final reportResult = await notificationsRepo.getReportById(
      notification.reportId,
    );

    return reportResult.fold(
      (failure) => NotificationTapResult.error(failure.message),
      (report) => NotificationTapResult.openReport(report),
    );
  }

  Future<void> markAsRead(ReportNotificationEntity notification) async {
    if (!notification.isRead && notification.id.isNotEmpty) {
      final markResult = await notificationsRepo.markNotificationAsRead(
        notification.id,
      );

      markResult.fold(
        (failure) {
          throw Exception(failure.message);
        },
        (_) {
          final currentState = state;
          if (currentState is GetNotificationsSuccess) {
            final updatedNotifications = currentState.notifications
                .map(
                  (item) => item.id == notification.id
                      ? item.copyWith(isRead: true)
                      : item,
                )
                .toList();
            emit(GetNotificationsSuccess(notifications: updatedNotifications));
          }
        },
      );
    }
  }

  Future<NotificationOpenResult> openNotification(
    ReportNotificationEntity notification,
  ) async {
    String? warningMessage;

    if (!notification.isRead && notification.id.isNotEmpty) {
      final markResult = await notificationsRepo.markNotificationAsRead(
        notification.id,
      );

      markResult.fold(
        (failure) {
          warningMessage = failure.message;
        },
        (_) {
          final currentState = state;
          if (currentState is GetNotificationsSuccess) {
            final updatedNotifications = currentState.notifications
                .map(
                  (item) => item.id == notification.id
                      ? item.copyWith(isRead: true)
                      : item,
                )
                .toList();
            emit(GetNotificationsSuccess(notifications: updatedNotifications));
          }
        },
      );
    }

    final reportResult = await notificationsRepo.getReportById(
      notification.reportId,
    );

    return reportResult.fold(
      (failure) => throw Exception(failure.message),
      (report) =>
          NotificationOpenResult(report: report, warning: warningMessage),
    );
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}

class NotificationOpenResult {
  const NotificationOpenResult({required this.report, this.warning});

  final ReportEntity report;
  final String? warning;
}

class NotificationTapResult {
  final ReportEntity? report;
  final String? errorMessage;
  final NotificationTapAction action;

  const NotificationTapResult.markedAsRead()
    : report = null,
      errorMessage = null,
      action = NotificationTapAction.markedAsRead;

  const NotificationTapResult.openReport(ReportEntity report)
    : report = report,
      errorMessage = null,
      action = NotificationTapAction.openReport;

  const NotificationTapResult.error(String message)
    : report = null,
      errorMessage = message,
      action = NotificationTapAction.error;
}

enum NotificationTapAction { markedAsRead, openReport, error }
