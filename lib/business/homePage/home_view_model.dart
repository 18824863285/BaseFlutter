import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/homePage/home_model.dart';
import 'package:wan_android_flutter/business/homePage/model/article.dart';
import 'package:wan_android_flutter/business/homePage/model/logout_result.dart';
import 'package:wan_android_flutter/business/login/login_page.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  var refreshController = RefreshController(initialRefresh: true);

  List<Datas> dataList = [];

  int _currIndex = 0;

  bool isRequest = true;

  @factoryMethod
  HomeViewModel();

  void _getArticleList() {
    isRequest = true;
    int size;
    sendRequest<Article>(model.getArticleList(_currIndex), (value) {
      isRequest = false;
      size = value.data.datas.length;
      if (_currIndex == 0) {
        dataList = value.data.datas;
        refreshController.refreshCompleted();
      } else {
        dataList.addAll(value.data.datas);
        refreshController.loadComplete();
      }
      if (size < 10) {
        refreshController.loadNoData();
      }
      notifyPage();
    }, error: (e) {
      isRequest = false;
    });
  }

  void logout() {
    sendRequest<LogoutResult>(model.logout(), (value) {
      if (value.errorCode == 0) {
        UserInfoSp.getInstance().clear();
        pop();
        push(LoginPage());
      } else {
        showToast(value.errorMsg);
      }
    }, isNeedLoading: true);
  }

  Datas getData(int index) {
    if (index <= dataList.length - 1) {
      return dataList[index];
    } else {
      return null;
    }
  }

  refresh() {
    _currIndex = 0;
    _getArticleList();
  }

  void loadMore() {
    _currIndex++;
    print("====>_currIndex:$_currIndex");
    _getArticleList();
  }
}
