import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/dialog/bottom_dialog.dart';
import 'package:wan_android_flutter/const/resource.dart';

class ShareDialog extends BottomDialog {
  @override
  Widget getChild() => Container(
        height: 100,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      R.ASSETS_IMAGES_WX_JPG,
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
                flex: 1),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      R.ASSETS_IMAGES_QQ_JPG,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                flex: 1),
          ],
        ),
      );

  @override
  bool isOutsideDismiss() => true;
}
