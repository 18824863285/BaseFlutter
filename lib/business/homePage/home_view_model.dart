import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/homePage/home_model.dart';
import 'package:wan_android_flutter/business/homePage/model/article.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  List<Datas> dataList = [];

  int _currIndex = 0;

  bool isRequest = true;

  @factoryMethod
  HomeViewModel();

  void _getArticleList() {
    isRequest = true;
    sendRequest<Article>(model.getArticleList(_currIndex), (value) {
      isRequest = false;
      if (_currIndex == 0) {
        dataList = value.data.datas;
      } else {
        dataList.addAll(value.data.datas);
      }
      notifyPage();
    }, error: (e) {
      isRequest = false;
    });
  }

  void refresh() {
    _currIndex = 0;
    _getArticleList();
  }

  void loadMore() {
    _currIndex++;
    _getArticleList();
  }
}
