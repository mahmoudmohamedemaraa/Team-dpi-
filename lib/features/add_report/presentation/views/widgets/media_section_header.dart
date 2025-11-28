import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/media_manager.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class MediaSectionHeader extends StatelessWidget {
  const MediaSectionHeader({
    super.key,
    required this.mediaManager,
    required this.onMediaChanged,
  });

  final MediaManager mediaManager;
  final VoidCallback onMediaChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).photosAndVideos,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.start,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                await mediaManager.pickImages(context);
                onMediaChanged();
              },
              icon: Icon(Icons.photo_library, color: AppTheme.primaryColor),
              tooltip: S.of(context).addingPhoto,
            ),
            IconButton(
              onPressed: () async {
                await mediaManager.pickVideo(context);
                onMediaChanged();
              },
              icon: Icon(Icons.videocam, color: AppTheme.primaryColor),
              tooltip:  S.of(context).addingVideo,
            ),
          ],
        ),
      ],
    );
  }
}
