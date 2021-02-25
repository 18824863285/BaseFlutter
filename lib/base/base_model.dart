import 'dart:async';

import 'package:wan_android_flutter/retrofit/RestClient.dart';

import 'event/Loading.dart';
import 'event_bus/event_bus.dart';
import 'inject/injector.dart';

abstract class BaseModel {
  var restClient = getIt.get<RestClient>();

  static final _loading = Loading();

  static final _dismissLoading = Loading(status: Loading.DISMISS_LOADING);

  int needLoadingRequestCount = 0;

  bool isLoading = false;

  void showLoading(bool isNeedLoading) {
    if (isNeedLoading) {
      needLoadingRequestCount++;
      if (!isLoading) {
        isLoading = true;
        EventBus.instance.fire(_loading);
      }
    }
  }

  void dismissLoading(bool isNeedLoading) {
    if (isNeedLoading) {
      needLoadingRequestCount--;
      if (needLoadingRequestCount == 0) {
        isLoading = false;
        EventBus.instance.fire(_dismissLoading);
      }
    }
  }

  /// 发起网络请求，同时处理异常，loading
  void sendRequest<T>(Future<T> future, FutureOr<dynamic> onValue(T value),
      {Function(Exception e) error, bool isNeedLoading = true}) {
    showLoading(isNeedLoading);
    future.then(onValue).whenComplete(() {
      dismissLoading(isNeedLoading);
    }).catchError((e) {
      dismissLoading(isNeedLoading);
      if (error != null) {
        error(e);
      }
    });
  }
}
