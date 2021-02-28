import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wan_android_flutter/business/login/model/login_result.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

// @injectable
// class LoginModel extends BaseModel {
//   @factoryMethod
//   LoginModel();
//
// }

part 'login_model.g.dart';

@RestApi(baseUrl: url)
abstract class LoginModel {
  factory LoginModel(Dio dio) = _LoginModel;

  @POST("user/login")
  @FormUrlEncoded()
  Future<LoginResult> login(@Field() String username, @Field() String password);
}