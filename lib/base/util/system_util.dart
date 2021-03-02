import 'dart:ui';

import 'package:flutter/cupertino.dart';

class SystemUtil {
  static double getStatusBarHigh() => MediaQueryData.fromWindow(window).padding.top;
}
