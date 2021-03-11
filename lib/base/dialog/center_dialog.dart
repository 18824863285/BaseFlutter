import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/adapter/screen/screen_adapter_mixin.dart';

// ignore: must_be_immutable
abstract class CenterDialog extends StatefulWidget with ScreenAdapterMixin{
  Widget child;
  bool outsideDismiss;
  CenterState centerState;

  @override
  State<StatefulWidget> createState() => centerState = CenterState();

  Widget getChild();

  bool isOutsideDismiss();

  void init() {
    child = getChild();
    outsideDismiss = isOutsideDismiss();
  }

  void show(BuildContext context) {
    init();
    showDialog(
      context: context,
      barrierDismissible: outsideDismiss,
      builder: (_) => StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
        return this;
      }),
    );
  }

  void dismiss() {
    Navigator.of(centerState.context).pop();
  }
}

class CenterState extends State<CenterDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: widget.child,
        ),
      ),
      onWillPop: () async {
        return widget.outsideDismiss;
      });
}
