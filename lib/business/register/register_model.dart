
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

import 'model/register_result.dart';

part 'register_model.g.dart';


@RestApi(baseUrl: url)
abstract class RegisterModel{
  factory RegisterModel(Dio dio) = _RegisterModel;

  @POST("user/register")
  @FormUrlEncoded()
  Future<RegisterResult> register(@Field() String username, @Field() String password, @Field() String rePassword);

}
