import 'package:flutter/cupertino.dart';

import 'navigator_helper.dart';

mixin NavigatorMixin {
  void push(BuildContext context, Widget page) {
    NavigatorHelper.push(context, page);
  }

  void pushForResult(
      BuildContext context, Widget page, Function(dynamic) callBack) {
    NavigatorHelper.pushForResult(context, page, callBack);
  }

}
