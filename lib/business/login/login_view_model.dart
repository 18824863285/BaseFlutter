import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/login/login_model.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginModel> {
  @factoryMethod
  LoginViewModel();

  String loginName = "";
  String psw = "";

  void login() {
    if (loginName.isEmpty) {
      showToast(S.of(context).login_is_not_empty);
    } else if (psw.isEmpty) {
      showToast(S.of(context).login_psw_is_not_empty);
    } else {}
  }
}
