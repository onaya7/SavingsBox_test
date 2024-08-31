import 'package:intl/intl.dart';

class DateHelpers {
  DateHelpers._();

  static String formatDateTime(DateTime dateTime) {
    final daySuffix = _getDaySuffix(dateTime.day);
    final formattedDate = DateFormat('EEE d').format(dateTime);
    final formattedTime = DateFormat('hh:mma').format(dateTime).toLowerCase();
    return '$formattedDate$daySuffix $formattedTime';
  }

  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
