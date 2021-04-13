// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RegisterModel implements RegisterModel {
  _RegisterModel(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RegisterResult> register(username, password, repassword) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
      'repassword': repassword
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterResult>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterResult.fromJson(_result.data!);
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
