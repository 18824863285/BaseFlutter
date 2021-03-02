
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'main_model.g.dart';

@RestApi(baseUrl: url)
abstract class MainModel{
  factory MainModel(Dio dio) = _MainModel;

}