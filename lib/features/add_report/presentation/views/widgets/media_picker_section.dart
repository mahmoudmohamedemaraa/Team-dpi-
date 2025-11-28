import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/media_manager.dart';
import 'image_widget.dart';
import 'media_section_header.dart';
import 'video_thumbnail_widget.dart';

class MediaPickerSection extends StatelessWidget {
  const MediaPickerSection({
    super.key,
    required this.mediaManager,
    required this.onMediaChanged,
  });

  final MediaManager mediaManager;
  final VoidCallback onMediaChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediaSectionHeader(
          mediaManager: mediaManager,
          onMediaChanged: onMediaChanged,
        ),
        const SizedBox(height: 12),

        if (mediaManager.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: mediaManager.length,
            itemBuilder: (context, index) {
              final file = mediaManager.selectedMedia[index];
              final isVideo = mediaManager.isVideoFile(file);

              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: isVideo
                        ? VideoThumbnailWidget(file: file)
                        : ImageWidget(file: file),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        mediaManager.removeMedia(index);
                        onMediaChanged();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        else
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).addPhotosAndVideos,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
