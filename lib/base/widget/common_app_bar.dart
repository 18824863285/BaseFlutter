import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/navigator/navigator_helper.dart';
import 'package:wan_android_flutter/const/resource.dart';

class CommonAppBar extends AppBar {
  final String titleStr;
  final BuildContext context;

  CommonAppBar(this.context, {this.titleStr = ""})
      : super(
            toolbarHeight: 45,
            centerTitle: true,
            title: Text(
              titleStr,
              style: TextStyle(color: Color(0Xff313133), fontSize: 16),
            ),
            backgroundColor: Colors.white,
            leading: BackButton(
              color: Color(0Xff313133),
              onPressed: () {
                NavigatorHelper.pop(context);
              },
            ));
}
