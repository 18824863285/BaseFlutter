import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/business/project/model/project_classification.dart';
import 'package:wan_android_flutter/business/project/model/projects.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'project_model.g.dart';

@RestApi(baseUrl: url)
abstract class ProjectModel {
  factory ProjectModel(Dio dio) = _ProjectModel;

  @GET("project/tree/json")
  Future<ProjectClassification> getProjectClassification();

  @GET("project/list/{index}/json")
  Future<Projects> getProjects(@Path("index") int index, @Query("cid") int? cid);
}
