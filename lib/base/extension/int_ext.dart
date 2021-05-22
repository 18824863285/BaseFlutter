import 'dart:ui';

//import 'package:wan_android_flutter/base/extension/int_ext.dart';

extension IntExt on int {
  /// 数字变颜色
  Color toColor() => Color(this);

  /// 遍历数量
  void each(bool? Function(int) block) {
    for (int i = 0; i < this; i++) {
      bool? isBreak = block(i);
      if (isBreak != null && isBreak) {
        break;
      }
    }
  }
}
