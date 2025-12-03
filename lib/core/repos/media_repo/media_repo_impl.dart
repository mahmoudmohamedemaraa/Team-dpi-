import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:depi_project/core/errors/failures.dart';
import 'package:depi_project/core/services/storage_service.dart';
import 'package:depi_project/core/utils/backend_endpoint.dart';

import 'media_repo.dart';

class MediaRepoImpl implements MediaRepo {
  final StorageService storageService;

  MediaRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadMedia(
    File file, {
    bool isVideo = false,
  }) async {
    try {
      String url = await storageService.uploadFile(
        file,
        BackendEndpoint.uploadMedia,
        isVideo: isVideo,
      );
      return Right(url);
    } catch (e) {
      log('Error uploading media: $e');
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      return Left(ServerFailure(errorMessage));
    }
  }
}
