
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

import 'model/official_account.dart';

part 'official_accounts_model.g.dart';

@RestApi(baseUrl: url)
abstract class OfficialAccountsModel{
  factory OfficialAccountsModel(Dio dio) = _OfficialAccountsModel;

  @GET("wxarticle/chapters/json")
  Future<OfficialAccount> getOfficialAccounts();

}