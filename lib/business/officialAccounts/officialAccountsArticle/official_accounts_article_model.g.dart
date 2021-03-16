// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_accounts_article_model.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OfficialAccountsArticleModel implements OfficialAccountsArticleModel {
  _OfficialAccountsArticleModel(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<OfficialAccountsArticle> getOfficialAccountsArticle(id, index) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(index, 'index');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'wxarticle/list/$id/$index/json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = OfficialAccountsArticle.fromJson(_result.data);
    return value;
  }
}
