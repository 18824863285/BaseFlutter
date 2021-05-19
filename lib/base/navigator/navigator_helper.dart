import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/navigator/LeftToRightPageRoute.dart';

class NavigatorHelper {
  static push(BuildContext context, Widget widget) {
    Navigator.push(context, LeftToRightPageRoute(widget));
  }

  static pushForResult(BuildContext context, Widget widget,
      Function(dynamic) callBack) async {
    final result = await Navigator.push(context, LeftToRightPageRoute(widget));
    callBack(result);
  }

  static pop<T extends Object>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }
}
