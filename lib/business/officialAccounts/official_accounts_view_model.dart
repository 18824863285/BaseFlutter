import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/officialAccounts/official_accounts_model.dart';

@injectable
class OfficialAccountsViewModel extends BaseViewModel<OfficialAccountsModel> {
  @factoryMethod
  OfficialAccountsViewModel();
}
