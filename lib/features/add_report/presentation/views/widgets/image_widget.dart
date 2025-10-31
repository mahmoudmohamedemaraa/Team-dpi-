import 'dart:io';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      file,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[300],
          child: const Center(child: Icon(Icons.error, color: Colors.red)),
        );
      },
    );
  }
}
