import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

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

String formatDateTime(DateTime dateTime, [BuildContext? context]) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);
  final timeFormatter = DateFormat('hh:mm a');
  final dateFormatter = DateFormat('dd/MM/yyyy');

  final timeStr = timeFormatter.format(dateTime);
  final dateStr = dateFormatter.format(dateTime);

  // If no context, fallback to Arabic
  if (context == null) {
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

  final s = S.of(context);

  if (difference.inMinutes < 1) {
    return '$timeStr • ${s.now}';
  } else if (difference.inMinutes < 60) {
    final unit = difference.inMinutes == 1 ? s.minute : s.minutes;
    return '$timeStr • ${s.since} ${difference.inMinutes} $unit';
  } else if (difference.inHours < 24) {
    final unit = difference.inHours == 1 ? s.hour : s.hours;
    return '$timeStr • ${s.since} ${difference.inHours} $unit';
  } else if (difference.inDays < 7) {
    final unit = difference.inDays == 1 ? s.day : s.days;
    return '$timeStr $dateStr • ${s.since} ${difference.inDays} $unit';
  } else {
    return '$timeStr • $dateStr';
  }
}

String formatDateForDetails(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
}
