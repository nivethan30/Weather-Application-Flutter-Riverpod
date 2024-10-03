import 'package:intl/intl.dart';

/// Format a [DateTime] into a String in the format 'hh:mm a'.
///
/// Example: formatTime(DateTime(2022, 12, 24, 10, 30)) => '10:30 AM'
String formatTime(DateTime time) {
  String formatted = DateFormat('hh:mm a').format(time);
  return formatted;
}

/// Format a [DateTime] into a String in the format 'MMM, dd'.
///
/// Example: formatDateTime(DateTime(2022, 12, 24)) => 'Dec 24'
String formatDateTime(DateTime dateTime) {
  String formatted = DateFormat('MMM, dd').format(dateTime);
  return formatted;
}
