import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/base/util/reg_exp_util.dart';
import 'package:wan_android_flutter/business/register/register_model.dart';
import 'package:wan_android_flutter/event/register_result_event.dart';
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
      showToast("请输入正确格式的手机号码");
    } else if (psw.isEmpty || !RegExpUtil.isLoginPassword(psw)) {
      showToast("请输入6-16数字或字母组合的密码");
    } else if (psw != ensurePsw) {
      showToast("密码和确认密码不一致");
    } else {
      sendRequest<RegisterResult>(model.register(loginName, psw, ensurePsw),
          (value) {
        if (value.errorCode == 0) {
          UserInfoSp.getInstance().uid = value.data!.id!;
          UserInfoSp.getInstance().token = value.data!.token!;
          UserInfoSp.getInstance().userName = value.data!.username!;
          pop();
          sendEvent(RegisterResultEvent(succ: true));
        } else {
          showLongToast(value.errorMsg!);
        }
      }, isNeedLoading: true);
    }
  }
}
