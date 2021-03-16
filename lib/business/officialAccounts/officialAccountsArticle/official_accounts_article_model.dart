import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wan_android_flutter/business/officialAccounts/officialAccountsArticle/model/official_accounts_article.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';

part 'official_accounts_article_model.g.dart';

@RestApi(baseUrl: url)
abstract class OfficialAccountsArticleModel {
  factory OfficialAccountsArticleModel(Dio dio) = _OfficialAccountsArticleModel;

  @GET("wxarticle/list/{id}/{index}/json")
  Future<OfficialAccountsArticle> getOfficialAccountsArticle(
      @Path("id") int id, @Path("index") int index);
}
