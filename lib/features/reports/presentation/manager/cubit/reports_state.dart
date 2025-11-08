import 'package:depi_project/core/entities/report_entity.dart';

abstract class GetUserReportsState {
  const GetUserReportsState();
  @override
  List<Object?> get props => [];

}
class GetUserReportsInitial extends GetUserReportsState {}

class GetUserReportsLoading extends GetUserReportsState {}

class GetUserReportsSuccess extends GetUserReportsState {
  final List<ReportEntity> reports;
  const GetUserReportsSuccess(this.reports);
  @override
  List<Object?> get props => [reports];
}

class GetUserReportsError extends GetUserReportsState {
  final String message;
  const GetUserReportsError(this.message);
  @override
  List<Object?> get props => [message];
}