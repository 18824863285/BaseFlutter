import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/login/login_page.dart';
import 'package:wan_android_flutter/business/start/start_model.dart';

@injectable
class StartViewModel extends BaseViewModel<StartModel> {
  Timer _timer;
  int currTime = 5;

  @factoryMethod
  StartViewModel();

  void startCountdown(int seconds) {
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      currTime--;
      print("====>currTime:${currTime}");
      notifyListeners();
      if (currTime == 0) {
       // cancelCountdown();
        pop();
        push(LoginPage());
      }
    });
  }

  void cancelCountdown() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    super.dispose();
    cancelCountdown();
    print("====>dispose--StartViewModel");
  }
}
