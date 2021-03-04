import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/homePage/home_view_model.dart';

class HomePage extends BaseStatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends BaseState<HomePage, HomeViewModel>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }

}
