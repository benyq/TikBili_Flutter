import 'package:intl/intl.dart';

class TimeUtils {
  static final DateFormat _inputFormat = DateFormat("HH:mm:ss", "");

  // 格式化时间 timeMS -> HH:MM:SS
  static String time2String(int time) {
    final totalSecond = time ~/ 1000;
    final seconds = totalSecond % 60;
    final minutes = (totalSecond ~/ 60) % 60;
    final hours = totalSecond ~/ 3600;
    if (hours == 0) {
      return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
