import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/login/login_model.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginModel> {
  @factoryMethod
  LoginViewModel();

  void test(){}
}
