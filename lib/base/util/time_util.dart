class TimeUtil {

  // 将时间戳转为标准日期
  static String getStandardTime(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String y = fourDigits(dateTime.year);
    String m = twoDigits(dateTime.month);
    String d = twoDigits(dateTime.day);
    String h = twoDigits(dateTime.hour);
    String min = twoDigits(dateTime.minute);
    String sec = twoDigits(dateTime.second);
    return "$y-$m-$d $h:$min:$sec";
  }

  static String fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    return "${sign}000$absN";
  }

  static String threeDigits(int n) {
    if (n >= 100) return "$n";
    if (n >= 10) return "0$n";
    return "00$n";
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
