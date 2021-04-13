import 'package:flutter/cupertino.dart';

import 'navigator_helper.dart';

mixin NavigatorMixin {

  late BuildContext _buildContext;

  void setContext(BuildContext context){
    _buildContext = context;
  }

  void push(Widget page) {
    NavigatorHelper.push(_buildContext, page);
  }

  void pushForResult(Widget page, Function(dynamic) callBack) {
    NavigatorHelper.pushForResult(_buildContext, page, callBack);
  }

  void pop<T extends Object>([T? result]) {
    Navigator.pop(_buildContext, result);
  }

}
