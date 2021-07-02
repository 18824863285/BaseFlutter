import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/base/sharePreference/share_preference_mixin.dart';
import 'package:wan_android_flutter/dataBase/dataBase_mixin.dart';
import 'base_view_model_interface.dart';
import 'event_bus/event_bus_mixin.dart';
import 'inject/injector.dart';
import 'navigator/navigator_mixin.dart';
import 'toast/toast_mixin.dart';

abstract class BaseViewModel<M extends Object> extends ChangeNotifier
    with
        BaseViewModelInterface,
        NavigatorMixin,
        ToastMixin,
        SharePreferenceMixin,
        EventBusMixin,
        DataBaseMixin {
  int _loadNum = 0;
  int _minLoadNum = 1;
  late BuildContext context;
  late M model;
  bool _isDispose = false;

  bool get isDispose => _isDispose;

  int needLoadingRequestCount = 0;

  bool isLoading = false;

  Function()? showLoadingFun;

  Function? dismissLoadingFun;

  static bool isNeedCatchError = false;

  set minLoadNum(int value) {
    _minLoadNum = value;
  }

  set loadNum(int value) {
    _loadNum = value;
  }

  int get loadNum {
    return _loadNum;
  }

  void notifyPage() {
    if (!_isDispose) {
      loadNum++;
      print("====>loadNum:$loadNum");
      if (_loadNum >= _minLoadNum) {
        print("====>notifyListeners");
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
        showLoadingFun?.call();
      }
    }
  }

  void dismissLoading(bool isNeedLoading) {
    if (isNeedLoading) {
      needLoadingRequestCount--;
      if (needLoadingRequestCount == 0) {
        isLoading = false;
        if (dismissLoadingFun != null) {
          dismissLoadingFun!.call();
        }
        dismissLoadingFun?.call();
      }
    }
  }

  /// 发起网络请求，同时处理异常，loading
  void sendRequest<T>(Future<T> future, FutureOr<dynamic> onValue(T value),
      {Function(Exception e)? error, bool isNeedLoading = false}) {
    showLoading(isNeedLoading);
    future.then((t) {
      dismissLoading(isNeedLoading);
      onValue(t);
    });
    if (isNeedCatchError) {
      future.catchError((e) {
        dismissLoading(isNeedLoading);
        print("====>error:$e");
        if (error != null) {
          error(e);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
    setIsDispose(_isDispose);
  }
}
