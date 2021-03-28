import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

import 'common_app_bar.dart';

class CommonWidget extends StatefulWidget {
  final Widget widget;
  final String title;

  CommonWidget(this.title, this.widget);

  @override
  State<StatefulWidget> createState() => CommonState();
}

class CommonState extends State<CommonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, //解决键盘导致页面溢出
        appBar: CommonAppBar(context, titleStr: widget.title),
        body: widget.widget,
      ),
    );
  }
}
