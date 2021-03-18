
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/model/knowledge.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'knowledge_model.g.dart';

@RestApi(baseUrl: url)
abstract class KnowledgeModel{
  factory KnowledgeModel(Dio dio) = _KnowledgeModel;

  @GET("tree/json")
  Future<Knowledge> getKnowledge();
}