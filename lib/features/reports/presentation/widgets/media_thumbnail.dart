import 'package:flutter/material.dart';

import '../../../../core/helpers/media_helpers.dart';

class MediaThumbnail extends StatelessWidget {
  final String mediaUrl;
  final bool showMoreIndicator;
  final int remainingCount;

  const MediaThumbnail({
    super.key,
    required this.mediaUrl,
    this.showMoreIndicator = false,
    this.remainingCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isVideo = isVideoUrl(mediaUrl);
    final displayUrl = isVideo ? getVideoThumbnailUrl(mediaUrl) : mediaUrl;

    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              displayUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    isVideo ? Icons.videocam : Icons.image,
                    color: Colors.grey[400],
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              },
            ),
          ),
          if (isVideo)
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          if (showMoreIndicator)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '+$remainingCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
