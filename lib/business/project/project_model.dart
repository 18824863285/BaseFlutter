

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'project_model.g.dart';

@RestApi(baseUrl: url)
abstract class ProjectModel {
  factory ProjectModel(Dio dio) = _ProjectModel;

}