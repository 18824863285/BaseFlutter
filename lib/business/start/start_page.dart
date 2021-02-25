import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/start/start_view_model.dart';

class StartWidget extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends BaseState<StartWidget, StartViewModel> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
