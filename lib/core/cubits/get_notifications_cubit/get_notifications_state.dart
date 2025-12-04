part of 'get_notifications_cubit.dart';

@immutable

sealed class GetNotificationsState extends Equatable {
  const GetNotificationsState();

  @override
  List<Object?> get props => [];
}

final class GetNotificationsInitial extends GetNotificationsState {
  const GetNotificationsInitial();
}

final class GetNotificationsLoading extends GetNotificationsState {
  const GetNotificationsLoading();
}

final class GetNotificationsSuccess extends GetNotificationsState {
  final List<ReportNotificationEntity> notifications;

  const GetNotificationsSuccess({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

final class GetNotificationsFailure extends GetNotificationsState {
  final String message;

  const GetNotificationsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
