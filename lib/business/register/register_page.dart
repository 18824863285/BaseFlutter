import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/widget/common_widget.dart';
import 'package:wan_android_flutter/business/register/register_view_model.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

class RegisterPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends BaseState<RegisterPage, RegisterViewModel> {
  @override
  Widget build(BuildContext context) {
    return CommonWidget(
      "注册",
      Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 0, top: 50, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "账号",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 260,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(color: Color(0Xff313133), fontSize: 18),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "请输入登录密码",
                          ),
                          onChanged: (value) {
                            viewModel.loginName = value;
                          },
                        ),
                      ),
                      Container(
                        width: 260,
                        height: 1,
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 0, top: 10, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "密码",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 260,
                        height: 45,
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(color: Color(0Xff313133), fontSize: 18),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "请输入登录密码",
                          ),
                          onChanged: (value) {
                            viewModel.psw = value;
                          },
                        ),
                      ),
                      Container(
                        width: 260,
                        height: 1,
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 0, top: 10, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "确认密码",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 11),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 260,
                        height: 45,
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(color: Color(0Xff313133), fontSize: 18),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "请输入登录密码",
                          ),
                          onChanged: (value) {
                            viewModel.ensurePsw = value;
                          },
                        ),
                      ),
                      Container(
                        width: 260,
                        height: 1,
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 260,
            height: 50,
            margin: EdgeInsets.only(top: 50),
            child: RaisedButton(
                child: Text(
                  "注册",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Colors.blue,
                onPressed: () {
                  viewModel.register();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)))),
          )
        ],
      ),
    );
  }
}
