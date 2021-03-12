import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/search/model/hot_key.dart';
import 'package:wan_android_flutter/business/search/search_model.dart';

@injectable
class SearchViewModel extends BaseViewModel<SearchModel> {

  List<HotKeyItem> hotKeyItems;

  @factoryMethod
  SearchViewModel();

  void getHotSearchKey() {
    sendRequest<HotKey>(model.getHotkey(), (value) {
      hotKeyItems = value.data;
      notifyPage();
    }, isNeedLoading: true);
  }
}
