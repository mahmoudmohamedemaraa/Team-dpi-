import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_api/src/request/model/uploader_params.dart';
import 'dart:io';

import 'storage_service.dart';

class CloudinaryService implements StorageService {
  final Cloudinary cloudinary;
  final String _uploadPreset;

  CloudinaryService({required String cloudName, required String uploadPreset})
    : cloudinary = Cloudinary.fromCloudName(cloudName: cloudName),
      _uploadPreset = uploadPreset;

  @override
  Future<String> uploadFile(
    File file,
    String folderPath, {
    bool isVideo = false,
  }) async {
    try {
      final response = await cloudinary.uploader().upload(
        file,
        params: UploadParams(
          uploadPreset: _uploadPreset,
          folder: folderPath,

          resourceType: isVideo ? 'video' : 'image',
        ),
      );

      if (response?.data?.secureUrl == null) {
        throw Exception('Upload successful but no secure URL returned');
      }

      return response!.data!.secureUrl!;
    } catch (e) {
      throw Exception('Cloudinary upload failed: $e');
    }
  }
}
