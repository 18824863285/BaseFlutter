import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/officialAccounts/model/official_account.dart';
import 'package:wan_android_flutter/business/officialAccounts/official_accounts_model.dart';

@injectable
class OfficialAccountsViewModel extends BaseViewModel<OfficialAccountsModel> {

  List<OfficialAccountItem> officialAccounts;

  @factoryMethod
  OfficialAccountsViewModel();

  void getOfficialAccounts(Function(int length) callBack) {
    sendRequest<OfficialAccount>(model.getOfficialAccounts(), (value) {
      officialAccounts = value.data;
      callBack(officialAccounts.length);
      notifyPage();
    }, isNeedLoading: true);
  }
}
