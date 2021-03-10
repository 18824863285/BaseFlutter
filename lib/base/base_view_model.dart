import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'event_bus/event/Loading.dart';
import 'file:///D:/wan-android/wan_android_flutter/lib/base/event_bus/event_bus_mixin.dart';
import 'package:wan_android_flutter/base/sharePreference/share_preference_mixin.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';
import 'base_view_model_interface.dart';
import 'event_bus/event_bus.dart';
import 'inject/injector.dart';
import 'navigator/navigator_mixin.dart';
import 'toast/toast_mixin.dart';

abstract class BaseViewModel<M> extends ChangeNotifier
    with
        BaseViewModelInterface,
        NavigatorMixin,
        ToastMixin,
        SharePreferenceMixin,
        EventBusMixin {
  int _loadNum = 0;
  int _minLoadNum = 1;
  BuildContext context;
  M model;
  bool _isDispose = false;

  bool get isDispose => _isDispose;

  var restClient = getIt.get<RestClient>();

  static final _loading = Loading();

  static final _dismissLoading = Loading(status: Loading.DISMISS_LOADING);

  int needLoadingRequestCount = 0;

  bool isLoading = false;

  set minLoadNum(int value) {
    _minLoadNum = value;
  }

  set loadNum(int value) {
    _loadNum = value;
  }

  get loadNum {
    return _loadNum;
  }

  void notifyPage() {
    if (!_isDispose) {
      loadNum++;
      if (_loadNum >= _minLoadNum) {
        notifyListeners();
      }
    }
  }

  @override
  void init() {
    model = getIt.get<M>();
    setContext(context);
    setIsDispose(false);
  }

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
      {Function(Exception e) error, bool isNeedLoading = false}) {
    showLoading(isNeedLoading);
    future.then(onValue).whenComplete(() {
      dismissLoading(isNeedLoading);
    }).catchError((e) {
      print("====>error:$e");
      if (error != null) {
        error(e);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
    setIsDispose(_isDispose);
  }
}
