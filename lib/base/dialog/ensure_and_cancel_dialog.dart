import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/dialog/center_dialog.dart';

// ignore: must_be_immutable
class EnsureAndCancelDialog extends CenterDialog {
  final String content;
  final Function onCancel;
  final Function onEnsure;

  EnsureAndCancelDialog(this.content, {this.onCancel, this.onEnsure});

  @override
  Widget getChild() => Container(
        width: 260,
        decoration: new BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular((5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(this.content),
            ),
            Divider(
              color: Color(0XFFF5F5F5),
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    dismiss();
                    if (onCancel != null) {
                      onCancel.call();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 129.5,
                    height: 45,
                    child: Center(
                      child: Text(
                        "    取消    ",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 45,
                  color: Color(0XFFF5F5F5),
                ),
                GestureDetector(
                  onTap: () {
                    dismiss();
                    if (onEnsure != null) {
                      onEnsure.call();
                    }
                  },
                  child: Container(
                    width: 129.5,
                    height: 45,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "    确定    ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

  @override
  bool isOutsideDismiss() => false;
}
