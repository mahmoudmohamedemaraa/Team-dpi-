import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatelessWidget {
  const VideoThumbnailWidget({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: VideoThumbnail.thumbnailFile(
        video: file.path,
        imageFormat: ImageFormat.PNG,
        maxWidth: 200,
        quality: 75,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data != null) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.file(File(snapshot.data!), fit: BoxFit.cover),
              Container(
                color: Colors.black26,
                child: const Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        }
        return Container(
          color: Colors.black87,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        );
      },
    );
  }
}
