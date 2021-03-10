import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterDialog extends StatefulWidget {
  final Widget child;
  final bool outsideDismiss;

  CenterDialog(this.child, {this.outsideDismiss = true});

  @override
  State<StatefulWidget> createState() => CenterState();

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
        return this;
      }),
    );
  }
}

class CenterState extends State<CenterDialog> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (widget.outsideDismiss) {
            Navigator.of(context).pop();
          }
        },
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: widget.child,
          ),
        ),
      );
}
