import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


DateTime parseDateTime(dynamic dateValue) {
  if (dateValue is Timestamp) {
    return dateValue.toDate();
  } else if (dateValue is String) {
    return DateTime.parse(dateValue);
  } else if (dateValue is DateTime) {
    return dateValue;
  } else {
    return DateTime.now(); 
  }
}

String formatDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);
  final timeFormatter = DateFormat('hh:mm a');
  final dateFormatter = DateFormat('dd/MM/yyyy');

  final timeStr = timeFormatter.format(dateTime);
  final dateStr = dateFormatter.format(dateTime);

  if (difference.inMinutes < 1) {
    return '$timeStr • الآن';
  } else if (difference.inMinutes < 60) {
    return '$timeStr • منذ ${difference.inMinutes} دقيقة';
  } else if (difference.inHours < 24) {
    return '$timeStr • منذ ${difference.inHours} ساعة';
  } else if (difference.inDays < 7) {
    return '$timeStr $dateStr • منذ ${difference.inDays} يوم';
  } else {
    return '$timeStr • $dateStr';
  }
}

String formatDateForDetails(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
}
