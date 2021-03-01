import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/navigator/navigator_mixin.dart';
import 'package:wan_android_flutter/base/widget/loading_dialog.dart';
import 'package:wan_android_flutter/base/widget/toast_mixin.dart';
import 'base_state_interfce.dart';
import 'base_view_model.dart';
import 'event/Loading.dart';
import 'event_bus/event_bus.dart';
import 'inject/injector.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W> with BaseStateInterface, NavigatorMixin, ToastMixin {
  VM viewModel;
  EventBus eventBus;
  LoadingDialog loadingDialog;

  @override
  void initState() {
    super.initState();
    setContext(context);
    if (viewModel == null) {
      viewModel = getIt.get<VM>();
      viewModel.context = context;
      viewModel.init();
    }
    initEventBus();
  }

  void sendEvent(dynamic event) {
    eventBus.fire(event);
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

}
