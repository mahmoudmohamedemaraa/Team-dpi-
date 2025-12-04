import 'package:depi_project/core/theme/app_theme.dart';
import 'package:depi_project/core/helpers/media_manager.dart';
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
          'الصور والفيديوهات',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyLarge?.color,
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
              tooltip: 'إضافة صور',
            ),
            IconButton(
              onPressed: () async {
                await mediaManager.pickVideo(context);
                onMediaChanged();
              },
              icon: Icon(Icons.videocam, color: AppTheme.primaryColor),
              tooltip: 'إضافة فيديو',
            ),
          ],
        ),
      ],
    );
  }
}
