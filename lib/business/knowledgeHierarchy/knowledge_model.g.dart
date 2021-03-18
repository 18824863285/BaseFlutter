// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_model.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _KnowledgeModel implements KnowledgeModel {
  _KnowledgeModel(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Knowledge> getKnowledge() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('tree/json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Knowledge.fromJson(_result.data);
    return value;
  }
}
