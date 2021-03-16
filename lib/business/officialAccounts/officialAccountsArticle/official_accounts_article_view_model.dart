import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_listview_view_model.dart';
import 'package:wan_android_flutter/business/officialAccounts/model/official_account.dart';
import 'package:wan_android_flutter/business/officialAccounts/officialAccountsArticle/model/official_accounts_article.dart';
import 'official_accounts_article_model.dart';

@injectable
class OfficialAccountsArticleViewModel
    extends BaseListViewViewModel<Datas, OfficialAccountsArticleModel> {
  OfficialAccountItem officialAccount;

  @factoryMethod
  OfficialAccountsArticleViewModel();

  @override
  void getData() {
    sendRequest<OfficialAccountsArticle>(
        model.getOfficialAccountsArticle(officialAccount.id, currIndex),
        (value) {
      controlResult(value.data.datas);
    });
  }
}
