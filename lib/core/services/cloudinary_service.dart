import 'dart:io';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import 'storage_service.dart';

class CloudinaryService implements StorageService {
  final String _cloudName;
  final String _uploadPreset;
  final String _apiKey;
  final Uuid _uuid;
  final Dio _dio;

  CloudinaryService({
    required String cloudName,
    required String uploadPreset,
    required String apiKey,
  }) : _cloudName = cloudName,
       _uploadPreset = uploadPreset,
       _apiKey = apiKey,
       _uuid = const Uuid(),
       _dio = Dio();

  @override
  Future<String> uploadFile(
    File file,
    String folderPath, {
    bool isVideo = false,
  }) async {
    try {
      final String uniqueId = _uuid.v4();
      final String publicId = '$folderPath/$uniqueId';

      final String resourceType = isVideo ? 'video' : 'image';
      final String url =
          'https://api.cloudinary.com/v1_1/$_cloudName/$resourceType/upload';

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
        'upload_preset': _uploadPreset,
        'public_id': publicId,
        'api_key': _apiKey,
      });

      final response = await _dio.post(url, data: formData);

      if (response.statusCode != 200) {
        throw Exception(
          'Cloudinary upload failed with status: ${response.statusCode}. Response: ${response.data}',
        );
      }

      final Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('error')) {
        throw Exception(
          'Cloudinary API Error: ${responseData['error']['message']}',
        );
      }

      final String? secureUrl = responseData['secure_url'];

      if (secureUrl != null && secureUrl.isNotEmpty) {
        return secureUrl;
      } else {
        throw Exception(
          'Upload successful but no valid secure_url found in response.',
        );
      }
    } on DioException catch (e) {
      String errorMessage = 'Network or API error during Cloudinary upload.';
      if (e.response != null) {
        errorMessage +=
            ' Status: ${e.response?.statusCode}. Data: ${e.response?.data}';
      } else {
        errorMessage += ' Message: ${e.message}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during Cloudinary upload: $e',
      );
    }
  }
}
