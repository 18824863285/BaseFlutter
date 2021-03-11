import 'package:dio/dio.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';

class RequestHeadInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers
        .addAll({"Cookie": "JSESSIONID=${UserInfoSp.getInstance().token}"});
    return super.onRequest(options);
  }
}
