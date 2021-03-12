import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/adapter/screen/screen_adapter_mixin.dart';
import 'package:wan_android_flutter/base/toast/toast_mixin.dart';
import 'dialog/loading_dialog.dart';
import 'package:wan_android_flutter/base/navigator/navigator_mixin.dart';
import 'package:wan_android_flutter/base/sharePreference/share_preference_mixin.dart';
import 'base_state_interfce.dart';
import 'base_view_model.dart';
import 'event_bus/event_bus.dart';
import 'event_bus/event_bus_mixin.dart';
import 'inject/injector.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W>
    with
        BaseStateInterface,
        NavigatorMixin,
        ToastMixin,
        EventBusMixin,
        SharePreferenceMixin,
        ScreenAdapterMixin {
  VM viewModel;
  EventBus eventBus;
  LoadingDialog loadingDialog;

  bool isBuildFinish;

  @override
  void initState() {
    super.initState();
    isBuildFinish = false;
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {//说明build结束了
      print("====>build结束了");
      isBuildFinish = true;
      widgetsBinding.addPersistentFrameCallback((callback){
        print("addPersistentFrameCallback be invoke");
        //触发一帧的绘制
        widgetsBinding.scheduleFrame();
      });
    });

    setContext(context);
    setIsDispose(false);
    if (viewModel == null) {
      viewModel = getIt.get<VM>();
      viewModel.context = context;
      viewModel.init();
      viewModel.showLoadingFun = () {
        showLoading();
      };
      viewModel.dismissLoadingFun = () {
        loadingDialog?.dismissDialog();
      };
    }
    initEventBus();
  }

  @override
  void initEventBus() {
    if (eventBus == null) {
      eventBus = EventBus.get();
    }
  }

  void showLoading() async {
    if (isBuildFinish) {//必须等到父组件build结束后才能构建自己，https://blog.csdn.net/qq_39493848/article/details/108514136
      showDialog(
          context: context,
          builder: (_) {
            if (loadingDialog == null) {
              loadingDialog = LoadingDialog();
            }
            return loadingDialog;
          });
    } else {
      await Future.delayed(Duration(milliseconds: 10));
      showLoading();
    }
  }

  @override
  void dispose() {
    super.dispose();
    setIsDispose(true);
    viewModel?.showLoadingFun = null;
    viewModel?.dismissLoadingFun = null;
  }
}
