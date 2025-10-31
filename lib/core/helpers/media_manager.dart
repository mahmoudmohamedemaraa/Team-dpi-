import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'build_snack_bar.dart';

class MediaManager {
  final ImagePicker _picker = ImagePicker();
  final List<File> _selectedMedia = [];

  List<File> get selectedMedia => _selectedMedia;

  /// Pick multiple images from gallery
  Future<void> pickImages(BuildContext context) async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        _selectedMedia.addAll(images.map((xFile) => File(xFile.path)));
      }
    } catch (e) {
      buildSnackBar(
        title: 'خطأ',
        message: 'فشل في اختيار الصور',
        contentType: ContentType.failure,
        context: context,
      );
    }
  }

  /// Pick single video from gallery
  Future<void> pickVideo(BuildContext context) async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        _selectedMedia.add(File(video.path));
      }
    } catch (e) {
      buildSnackBar(
        context: context,
        title: 'خطأ',
        message: 'فشل في اختيار الفيديو',
        contentType: ContentType.failure,
      );
    }
  }

  /// Remove media at specific index
  void removeMedia(int index) {
    if (index >= 0 && index < _selectedMedia.length) {
      _selectedMedia.removeAt(index);
    }
  }

  /// Clear all selected media
  void clearAll() {
    _selectedMedia.clear();
  }

  bool isVideoFile(File file) {
    final extension = file.path.toLowerCase().split('.').last;
    return [
      'mp4',
      'mov',
      'avi',
      'mkv',
      'webm',
      'flv',
      'm4v',
    ].contains(extension);
  }

  /// Check if media list is empty
  bool get isEmpty => _selectedMedia.isEmpty;

  /// Check if media list is not empty
  bool get isNotEmpty => _selectedMedia.isNotEmpty;

  /// Get media count
  int get length => _selectedMedia.length;
}
