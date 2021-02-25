import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/start/start_model.dart';

class StartViewModel extends BaseViewModel<StartModel> {

  Timer _timer;
  int currTime = 5;

  void startCountdown(int seconds) {
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      currTime --;
      notifyPage();
      if (timer.tick == 0) {
        cancelCountdown();
        pop(context);
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
  }

}
