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

part 'RestClient.g.dart';

const url = "https://www.wanandroid.com/";

Dio dio = Dio(
    BaseOptions(baseUrl: url, connectTimeout: 30000, receiveTimeout: 30000));

void initRestClient() {
  dio.interceptors.add(LogInterceptor(
      requestHeader: true, requestBody: true, responseBody: true));
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
    dio.interceptors.add(LogInterceptor());
    final client = LoginModel(dio);
    return client;
  }

  RegisterModel registerModel() {
    dio.interceptors.add(LogInterceptor());
    final client = RegisterModel(dio);
    return client;
  }

  MainModel mainModel() {
    dio.interceptors.add(LogInterceptor());
    final client = MainModel(dio);
    return client;
  }

  HomeModel homeModel() {
    dio.interceptors.add(LogInterceptor());
    final client = HomeModel(dio);
    return client;
  }

  OfficialAccountsModel officialAccountsModel() {
    dio.interceptors.add(LogInterceptor());
    final client = OfficialAccountsModel(dio);
    return client;
  }

  KnowledgeModel knowledgeModel() {
    dio.interceptors.add(LogInterceptor());
    final client = KnowledgeModel(dio);
    return client;
  }

  ProjectModel projectModel() {
    dio.interceptors.add(LogInterceptor());
    final client = ProjectModel(dio);
    return client;
  }

}

@RestApi(baseUrl: url)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("user/login")
  Future<LoginResult> login(@Body() Map<String, dynamic> map);
}
