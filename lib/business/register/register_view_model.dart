import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/register/register_model.dart';

@injectable
class RegisterViewModel extends BaseViewModel<RegisterModel> {
  @factoryMethod
  RegisterViewModel();
}
