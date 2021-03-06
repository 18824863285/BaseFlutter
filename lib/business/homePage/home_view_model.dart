import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/homePage/home_model.dart';
import 'package:wan_android_flutter/business/homePage/model/article.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  List<Datas> dataList;

  @factoryMethod
  HomeViewModel();

  void getArticleList(int index) {
    sendRequest<Article>(model.getArticleList(index), (value) {
      dataList = value.data.datas;
      notifyPage();
    });
  }
}
