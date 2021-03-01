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
      S.of(context).register,
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
                    S.of(context).account,
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
                            hintText: S.of(context).input_login_psw,
                          ),
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
                    S.of(context).psw,
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
                            hintText: S.of(context).input_login_psw,
                          ),
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
                    S.of(context).ensure_psw,
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
                          keyboardType: TextInputType.number,
                          style:
                          TextStyle(color: Color(0Xff313133), fontSize: 18),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).input_login_psw,
                          ),
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
              child: Text(S.of(context).register, style: TextStyle(color: Colors.white, fontSize: 18),),
                color: Colors.blue,
                onPressed: (){

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)))),
          )
        ],
      ),
    );
  }
}
