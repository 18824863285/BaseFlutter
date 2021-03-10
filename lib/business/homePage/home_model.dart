
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/business/homePage/model/article.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'home_model.g.dart';

@RestApi(baseUrl: url)
abstract class HomeModel {
  factory HomeModel(Dio dio) = _HomeModel;

  @GET("article/list/{index}/json")
  @FormUrlEncoded()
  Future<Article> getArticleList(@Path("index") int index);

}
