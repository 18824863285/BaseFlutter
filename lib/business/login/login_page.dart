import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_change_notifier_provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

import 'login_view_model.dart';

// ignore: must_be_immutable
class LoginPage extends BaseStatefulWidget {
  LoginPage(String url, int index, params) : super(url, index, params);

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends BaseState<LoginPage, LoginViewModel> {
  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider(
      context,
      viewModel: viewModel,
      init: () {
        viewModel.test();
      },
      widget: MaterialApp(
        home: Container(
          child: Text(S.of(context).setting_personal_setting),
        ),
      ),
    );
  }
}
