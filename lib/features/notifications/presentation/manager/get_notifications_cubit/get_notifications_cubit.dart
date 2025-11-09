import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/report_notification_entity.dart';
import '../../../domain/repos/notifications_repo.dart';

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

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
