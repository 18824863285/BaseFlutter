import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorHelper {
  static push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }

  static pushForResult(
      BuildContext context, Widget widget, Function(dynamic) callBack) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
    callBack(result);
  }

  static pop<T extends Object>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }
}
