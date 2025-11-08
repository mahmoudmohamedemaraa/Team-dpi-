bool isVideoUrl(String url) {
  return url.contains('/video/');
}

String getVideoThumbnailUrl(String videoUrl) {
  String thumbnailUrl = videoUrl.replaceFirst(
    '/video/upload/',
    '/video/upload/so_0/',
  );

  thumbnailUrl = thumbnailUrl.replaceAll(
    RegExp(r'\.(mp4|mov|avi|mkv|flv|wmv)$'),
    '.jpg',
  );

  return thumbnailUrl;
}
