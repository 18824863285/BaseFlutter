import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

const url = "https://www.wanandroid.com/";

Dio dio = Dio(
    BaseOptions(baseUrl: url, connectTimeout: 30000, receiveTimeout: 30000));

@module
abstract class RetrofitModule {
  //BaseUrl不能被注册两次
  // @Named("BaseUrl")
  // String get baseUrl => 'https://www.wanandroid.com/';

  @singleton
  RestClient restClient() {
    dio.interceptors.add(LogInterceptor());
    final client = RestClient(dio);
    return client;
  }

}

@RestApi(baseUrl: url)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}





