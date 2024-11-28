class StringUtil {
  static String getVideoDuration(int duration) {



    return '';
  }

  static String num2String(int num) {
    if (num < 10000) return "$num";
    return "${(num.toDouble() / 10000).toStringAsFixed(1)}万";
  }
}