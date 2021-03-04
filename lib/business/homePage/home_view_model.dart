import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/homePage/home_model.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  @factoryMethod
  HomeViewModel();
}
