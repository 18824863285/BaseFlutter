import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ScreenUtil {
  static double getStatusBarHigh() => MediaQueryData.fromWindow(window).padding.top;
}
