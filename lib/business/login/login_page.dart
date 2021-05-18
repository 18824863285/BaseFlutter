import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/dialog/center_dialog.dart';
import 'package:wan_android_flutter/base/event_bus/event_bus.dart';
import 'package:wan_android_flutter/business/main/mian_page.dart';
import 'package:wan_android_flutter/business/register/register_page.dart';
import 'package:wan_android_flutter/event/register_result_event.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';
import 'login_view_model.dart';
import 'package:wan_android_flutter/const/resource.dart';

// ignore: must_be_immutable
class LoginPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends BaseState<LoginPage, LoginViewModel> {
  @override
  void initEventBus() {
    super.initEventBus();
    EventBus.instance!.on<RegisterResultEvent>().listen((event) {
      pop();
      push(MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    pop();
                    exit(0);
                  },
                  child: Image.asset(
                    R.ASSETS_IMAGES_ROUND_ARROW_FORWARD_LEFT_PNG,
                    width: 20,
                    height: 20,
                  ),
                )),
            Positioned(
                top: 100,
                child: Text("账号登录",
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            Positioned(
              top: 200,
              child: Container(
                height: 60,
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Color(0x30cccccc),
                      filled: true,
                      hintText: UserInfoSp.getInstance().userName.isEmpty
                          ? "请输入登录账号"
                          : UserInfoSp.getInstance().userName,
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)))),
                  onChanged: (text) {
                    viewModel.loginName = text;
                  },
                ),
              ),
            ),
            Positioned(
                top: 280,
                child: Container(
                  height: 60,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                        hintText: "请输入登录密码",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    onChanged: (text) {
                      viewModel.psw = text;
                    },
                  ),
                )),
            Positioned(
              top: 420,
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                child: ConstrainedBox(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    onPressed: () {
                      viewModel.login();
                    },
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  constraints: new BoxConstraints.expand(),
                ),
              ),
            ),
            Positioned(
                top: 480,
                child: GestureDetector(
                  onTap: () {
                    push(RegisterPage());
                  },
                  child: Text(
                    "注册",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
