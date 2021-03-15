import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/search/model/hot_key.dart';
import 'package:wan_android_flutter/business/search/search_model.dart';
import 'model/history_search_key.dart';

@injectable
class SearchViewModel extends BaseViewModel<SearchModel> {
  List<HotKeyItem> hotKeyItems;
  List<HistorySearchKey> historySearchKeys;

  @factoryMethod
  SearchViewModel();

  get term => null;

  @override
  void init() {
    super.init();
    minLoadNum = 2;
  }

  void getHotSearchKey() {
    sendRequest<HotKey>(model.getHotkey(), (value) {
      hotKeyItems = value.data;
      notifyPage();
    }, isNeedLoading: true);
  }

  void getHistorySearchKeys() async{
    historySearchKeys = await database.historySearchKeyDao.findHistorySearchKeys();
    print("====>historySearchKeys:${historySearchKeys.length}");
    notifyPage();
  }

  void saveSearchKeyToDataBase(String key) async {
    int result = await database.historySearchKeyDao.insertHotKeyItem(HistorySearchKey(key));
    print("====>result:$result");
    getHistorySearchKeys();
  }
}
