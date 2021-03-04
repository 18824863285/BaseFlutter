
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'official_accounts_model.g.dart';

@RestApi(baseUrl: url)
class OfficialAccountsModel{
  factory OfficialAccountsModel(Dio dio) = _OfficialAccountsModel;
}