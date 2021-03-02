import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/base/util/reg_exp_util.dart';
import 'package:wan_android_flutter/business/register/register_model.dart';
import 'package:wan_android_flutter/enent/register_result_event.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';
import 'model/register_result.dart';

@injectable
class RegisterViewModel extends BaseViewModel<RegisterModel> {
  String loginName = "";
  String psw = "";
  String ensurePsw = "";

  @factoryMethod
  RegisterViewModel();

  void register() {
    if (loginName.isEmpty || !RegExpUtil.isMobilePhoneNum(loginName)) {
      showToast(S.of(context).true_login_name);
    } else if (psw.isEmpty || !RegExpUtil.isLoginPassword(psw)) {
      showToast(S.of(context).true_login_psw);
    } else if (psw != ensurePsw) {
      showToast(S.of(context).ensure_psw_true);
    } else {
      sendRequest<RegisterResult>(model.register(loginName, psw, ensurePsw), (value) {
        if(value.errorCode == 0){
          UserInfoSp.getInstance().uid = value.data.id;
          UserInfoSp.getInstance().token = value.data.token;
          UserInfoSp.getInstance().userName = value.data.username;
          sendEvent(RegisterResultEvent(succ: true));
          pop();
        }else{
          showLongToast(value.errorMsg);
        }
      });
    }
  }
}
