import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/base/adapter/screen/screen_adapter_mixin.dart';
import 'package:wan_android_flutter/base/navigator/navigator_mixin.dart';
import 'package:wan_android_flutter/base/toast/toast_mixin.dart';
import 'dialog_interface.dart';

abstract class BaseDialog extends DialogInterface
    with ScreenAdapterMixin, NavigatorMixin, ToastMixin {
  Widget child;
  bool outsideDismiss;
  BuildContext context;

  void init() {
    child = getChild();
    outsideDismiss = isOutsideDismiss();
  }

  void dismiss() {
    pop();
  }
}
