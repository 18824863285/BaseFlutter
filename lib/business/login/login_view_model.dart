import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/login/login_model.dart';
import 'package:wan_android_flutter/business/login/model/login_result.dart';
import 'package:wan_android_flutter/business/main/mian_page.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginModel> {
  @factoryMethod
  LoginViewModel();

  String loginName = "";
  String psw = "";

  void login() {
    if (loginName.isEmpty) {
      showToast("登录账号不可为空");
    } else if (psw.isEmpty) {
      showToast("登录密码不可为空");
    } else {
      sendRequest<LoginResult>(model.login(loginName, psw), (value) {
        if (value.errorCode == 0) {
          UserInfoSp.getInstance().uid = value.data!.id!;
          UserInfoSp.getInstance().token = value.data!.token!;
          UserInfoSp.getInstance().userName = value.data!.username!;
          pop();
          push(MainPage());
        } else {
          showToast(value.errorMsg!);
        }
      }, isNeedLoading: true);
    }
  }
}
