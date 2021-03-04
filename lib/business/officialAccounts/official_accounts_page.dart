import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/officialAccounts/official_accounts_view_model.dart';

class OfficialAccountsPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OfficialAccountsState();
  }
}

class OfficialAccountsState
    extends BaseState<OfficialAccountsPage, OfficialAccountsViewModel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
