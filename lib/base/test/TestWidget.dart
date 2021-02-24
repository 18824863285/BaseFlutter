import 'package:flutter/cupertino.dart';

import '../base_stateful_widget.dart';
import 'TestState.dart';

class TestWidget extends BaseStatefulWidget {

  TestWidget(String url, int index, params) : super(url, index, params);

  @override
  State<StatefulWidget> createState() => Teststate();

}
