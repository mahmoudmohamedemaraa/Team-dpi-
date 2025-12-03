import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/helpers/media_manager.dart';
import 'package:depi_project/core/repos/media_repo/media_repo.dart';
import 'package:depi_project/features/add_report/domain/repos/add_report_repo.dart';
import 'package:meta/meta.dart';

part 'add_report_state.dart';

class AddReportCubit extends Cubit<AddReportState> {
  AddReportCubit(this.mediaRepo, this.addReportRepo)
    : super(AddReportInitial());
  final MediaRepo mediaRepo;
  final AddReportRepo addReportRepo;
  final MediaManager mediaManager = MediaManager();

  Future<void> addReport(ReportEntity report, List<File> mediaFiles) async {
    emit(AddReportLoading());
    try {
      List<String> uploadedUrls = [];
      for (var file in mediaFiles) {
        final isVideo = mediaManager.isVideoFile(file);
        var result = await mediaRepo.uploadMedia(file, isVideo: isVideo);
        await result.fold(
          (failure) async {
            emit(AddReportFailure(failure.message));
            throw Exception(failure.message);
          },
          (url) async {
            uploadedUrls.add(url);
          },
        );
      }
      final reportWithUrls = report.copyWith(mediaUrls: uploadedUrls);
      var addResult = await addReportRepo.addReport(reportWithUrls);
      addResult.fold(
        (failure) => emit(AddReportFailure(failure.message)),
        (_) => emit(AddReportSuccess()),
      );
    } catch (e) {
      log('message: Error adding report: $e');
      emit(AddReportFailure('FAILED_TO_ADD_REPORT'));
    }
  }
}
