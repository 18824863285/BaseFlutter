// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_accounts_model.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OfficialAccountsModel implements OfficialAccountsModel {
  _OfficialAccountsModel(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<OfficialAccount> getOfficialAccounts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'wxarticle/chapters/json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = OfficialAccount.fromJson(_result.data);
    return value;
  }
}
