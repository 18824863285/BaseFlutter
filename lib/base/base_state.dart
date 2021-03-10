import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'event_bus/event/Loading.dart';
import 'file:///D:/wan-android/wan_android_flutter/lib/base/event_bus/event_bus_mixin.dart';
import 'package:wan_android_flutter/base/navigator/navigator_mixin.dart';
import 'file:///D:/wan-android/wan_android_flutter/lib/base/toast/toast_mixin.dart';
import 'package:wan_android_flutter/base/sharePreference/share_preference_mixin.dart';
import 'file:///D:/wan-android/wan_android_flutter/lib/base/dialog/loading_dialog.dart';
import 'base_state_interfce.dart';
import 'base_view_model.dart';
import 'event_bus/event_bus.dart';
import 'inject/injector.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W>
    with
        BaseStateInterface,
        NavigatorMixin,
        ToastMixin,
        EventBusMixin,
        SharePreferenceMixin {
  VM viewModel;
  EventBus eventBus;
  LoadingDialog loadingDialog;

  @override
  void initState() {
    super.initState();
    setContext(context);
    setIsDispose(false);
    if (viewModel == null) {
      viewModel = getIt.get<VM>();
      viewModel.context = context;
      viewModel.init();
    }
    initEventBus();
  }

  @override
  void initEventBus() {
    if (eventBus == null) {
      eventBus = EventBus.get();
      eventBus.on<Loading>().listen((event) {
        if (event.status == Loading.SHOW_LOADING) {
          showLoading();
        } else {
          if (loadingDialog != null) {
            loadingDialog.dismissDialog();
          }
        }
      });
    }
  }

  void showLoading() {
    showDialog(
        context: context,
        builder: (_) {
          if (loadingDialog == null) {
            loadingDialog = LoadingDialog();
          }
          return loadingDialog;
        });
  }

  @override
  void dispose() {
    super.dispose();
    setIsDispose(true);
  }
}
