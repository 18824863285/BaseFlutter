import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/business/main/main_view_model.dart';

class MainPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();

}

class MainState extends BaseState<MainPage, MainViewModel> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: ScreenUtil.getStatusBarHigh()),
          child: Text("ada"),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //
        // ),
      ),

    );
  }

}