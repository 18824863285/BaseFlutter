import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/login/login_model.dart';
import 'package:wan_android_flutter/business/login/model/login_result.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginModel> {
  @factoryMethod
  LoginViewModel();

  String loginName = "";
  String psw = "";

  void login() {
    print("====>login");
    if (loginName.isEmpty) {
      showToast(S.of(context).login_is_not_empty);
    } else if (psw.isEmpty) {
      showToast(S.of(context).login_psw_is_not_empty);
    } else {
      sendRequest<LoginResult>(model.login(loginName, psw), (value) {
        UserInfoSp.getInstance().uid = value.data.id;
        UserInfoSp.getInstance().token = value.data.token;
        UserInfoSp.getInstance().userName = value.data.username;
      });
    }
  }
}
