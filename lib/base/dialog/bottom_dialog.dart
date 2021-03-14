import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/dialog/base_dialog.dart';

// ignore: must_be_immutable
abstract class BottomDialog extends BaseDialog {
  void show(BuildContext context) {
    init();
    showModalBottomSheet(
        context: context,
        isDismissible: outsideDismiss,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0))),
        builder: (BuildContext context) {
          return WillPopScope(
              child: Material(
                type: MaterialType.transparency,
                child: child,
              ),
              onWillPop: () async {
                return outsideDismiss;
              });
        });
  }
}
