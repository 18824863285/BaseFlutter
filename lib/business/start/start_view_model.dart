import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/login/login_page.dart';
import 'package:wan_android_flutter/business/main/mian_page.dart';
import 'package:wan_android_flutter/business/start/start_model.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';

@injectable
class StartViewModel extends BaseViewModel<StartModel> {
  Timer? _timer;
  int currTime = 5;

  @factoryMethod
  StartViewModel();

  void startCountdown(int seconds) {
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      currTime--;
      notifyListeners();
      if (currTime == 0) {
        cancelCountdown();
        toNextPage();
      }
    });
  }

  void toNextPage(){
    pop();
    if(UserInfoSp.getInstance().isLogin){
      push(MainPage());
    }else{
      push(LoginPage());
    }
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
