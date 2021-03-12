
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/business/search/model/hot_key.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'search_model.g.dart';

@RestApi(baseUrl: url)
abstract class SearchModel{
  factory SearchModel(Dio dio) = _SearchModel;

  @GET("hotkey/json")
  @FormUrlEncoded()
  Future<HotKey> getHotkey();


}