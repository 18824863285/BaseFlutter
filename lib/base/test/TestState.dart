import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

import '../base_change_notifier_provider.dart';
import '../base_state.dart';


class Teststate<TestWidget, TestViewModel> extends BaseState {
  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider(
      context,
      viewModel: viewModel,
      widget: MaterialApp(
        home: Container(
          child: Text(S.of(context).setting_personal_setting),
        ),
      ),
    );
  }
}
