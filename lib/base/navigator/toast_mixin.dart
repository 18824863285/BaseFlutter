import 'package:fluttertoast/fluttertoast.dart';

mixin ToastMixin {
  void showToast(String msg,
      {Toast toastLength = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM,
      int timeInSecForIos = 1}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIos,
    );
  }

  void showShortToast(String msg) {
    showToast(msg, toastLength: Toast.LENGTH_SHORT);
  }

  void showLongToast(String msg) {
    showToast(msg, toastLength: Toast.LENGTH_LONG);
  }

}
