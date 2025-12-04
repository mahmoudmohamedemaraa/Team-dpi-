
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
              color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade800
             : Colors.grey.shade100,
              border: Border.all(color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255, 110, 110, 110)
             : const Color.fromARGB(255, 215, 210, 210),),
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
                    'اضغط على الأيقونات لإضافة الوسائط',
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
