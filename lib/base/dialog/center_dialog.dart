import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/dialog/base_dialog.dart';

// ignore: must_be_immutable
abstract class CenterDialog extends BaseDialog {
  void show(BuildContext context) {
    init();
    showDialog(
      context: context,
      barrierDismissible: outsideDismiss,
      builder: (_) => StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
        this.context = context;
        setContext(context);
        return WillPopScope(
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: child,
              ),
            ),
            onWillPop: () async {
              return outsideDismiss;
            });
      }),
    );
  }
}
