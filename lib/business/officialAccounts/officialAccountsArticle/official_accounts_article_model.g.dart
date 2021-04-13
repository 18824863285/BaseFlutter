// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_accounts_article_model.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OfficialAccountsArticleModel implements OfficialAccountsArticleModel {
  _OfficialAccountsArticleModel(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<OfficialAccountsArticle> getOfficialAccountsArticle(id, index) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OfficialAccountsArticle>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'wxarticle/list/$id/$index/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OfficialAccountsArticle.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
