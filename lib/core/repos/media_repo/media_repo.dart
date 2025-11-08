import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';

abstract class MediaRepo {
  Future<Either<Failure, String>> uploadMedia(
    File file, {
    bool isVideo = false,
  });
}
