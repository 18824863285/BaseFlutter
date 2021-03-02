import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/main/main_model.dart';

@injectable
class MainViewModel extends BaseViewModel<MainModel> {

  var currPageIndex = 0;

  @factoryMethod
  MainViewModel();
}
