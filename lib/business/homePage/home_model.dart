
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/business/homePage/model/article.dart';
import 'package:wan_android_flutter/business/homePage/model/banner.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';
import 'model/logout_result.dart';

part 'home_model.g.dart';

@RestApi(baseUrl: url)
abstract class HomeModel {
  factory HomeModel(Dio dio) = _HomeModel;

  @GET("article/list/{index}/json")
  @FormUrlEncoded()
  Future<Article> getArticleList(@Path("index") int index);


  @GET("user/logout/json")
  Future<LogoutResult> logout();

  @GET("banner/json")
  Future<Banner> getBanner();

}
