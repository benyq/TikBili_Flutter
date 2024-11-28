import 'dart:core';

class DateUtil {
  static const int MILLISECOND_OF_ONE_DAY = 86400000;
  static const int MILLISECOND_OF_ONE_HOUR = 3600000;
  static const int MILLISECOND_OF_ONE_MINUTE = 60000;

  static String formatTime(int timestamp) {
    final current = getDateModel(DateTime.now().millisecondsSinceEpoch);
    final inDate = getDateModel(timestamp);

    final cTime = inDate.timeInMillis;

    if (current.timeInMillis - cTime < MILLISECOND_OF_ONE_HOUR) {
      final minute = (current.timeInMillis - cTime) ~/ MILLISECOND_OF_ONE_MINUTE;
      return "$minute分钟前";
    }
    if (current.timeInMillis - cTime < MILLISECOND_OF_ONE_DAY) {
      if (current.day != inDate.day) {
        return "昨天 ${inDate.hour}-${inDate.minute}";
      }
      final hour = (current.timeInMillis - cTime) ~/ MILLISECOND_OF_ONE_HOUR;
      return "$hour小时前";
    }
    if (current.timeInMillis - cTime < MILLISECOND_OF_ONE_DAY * 7) {
      return "${current.day - inDate.day}天前";
    }
    if (current.year == inDate.year) {
      return "${inDate.month}-${inDate.day}";
    }
    return "${inDate.year}-${inDate.month}-${inDate.day}";
  }

  static DateModel getDateModel(int cTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(cTime);
    final year = date.year;
    final month = date.month;
    final day = date.day;
    final hour = date.hour;
    final minute = date.minute;
    return DateModel(year, month, day, hour, minute, cTime);
  }
}

class DateModel {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int timeInMillis;

  DateModel(this.year, this.month, this.day, this.hour, this.minute, this.timeInMillis);
}
