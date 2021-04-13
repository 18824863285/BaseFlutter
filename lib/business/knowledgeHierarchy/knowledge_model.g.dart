// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_model.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _KnowledgeModel implements KnowledgeModel {
  _KnowledgeModel(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Knowledge> getKnowledge() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Knowledge>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'tree/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Knowledge.fromJson(_result.data!);
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
