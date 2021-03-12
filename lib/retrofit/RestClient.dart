import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:wan_android_flutter/business/homePage/home_model.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_model.dart';
import 'package:wan_android_flutter/business/login/login_model.dart';
import 'package:wan_android_flutter/business/login/model/login_result.dart';
import 'package:wan_android_flutter/business/main/main_model.dart';
import 'package:wan_android_flutter/business/officialAccounts/official_accounts_model.dart';
import 'package:wan_android_flutter/business/project/project_model.dart';
import 'package:wan_android_flutter/business/register/register_model.dart';
import 'package:wan_android_flutter/business/search/search_model.dart';
import 'package:wan_android_flutter/retrofit/request_head_interceptor.dart';

part 'RestClient.g.dart';

const url = "https://www.wanandroid.com/";

Dio dio = Dio(
    BaseOptions(baseUrl: url, connectTimeout: 30000, receiveTimeout: 30000));

void initRestClient() {
  dio.interceptors.add(LogInterceptor(
      requestHeader: true, requestBody: true, responseBody: true));
  dio.interceptors.add(RequestHeadInterceptor());
}

@module
abstract class RetrofitModule {
  //BaseUrl不能被注册两次
  // @Named("BaseUrl")
  // String get baseUrl => 'https://www.wanandroid.com/';

  RestClient restClient() {
    final client = RestClient(dio);
    return client;
  }

  LoginModel loginModel() {
    final client = LoginModel(dio);
    return client;
  }

  RegisterModel registerModel() {
    final client = RegisterModel(dio);
    return client;
  }

  MainModel mainModel() {
    final client = MainModel(dio);
    return client;
  }

  HomeModel homeModel() {
    final client = HomeModel(dio);
    return client;
  }

  OfficialAccountsModel officialAccountsModel() {
    final client = OfficialAccountsModel(dio);
    return client;
  }

  KnowledgeModel knowledgeModel() {
    final client = KnowledgeModel(dio);
    return client;
  }

  ProjectModel projectModel() {
    final client = ProjectModel(dio);
    return client;
  }

  SearchModel searchModel() {
    final client = SearchModel(dio);
    return client;
  }

}

@RestApi(baseUrl: url)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("user/login")
  Future<LoginResult> login(@Body() Map<String, dynamic> map);
}
