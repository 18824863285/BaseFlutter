import 'package:flutter/cupertino.dart';
import 'base_view_model_interface.dart';
import 'base_model.dart';
import 'event_bus/event_bus.dart';
import 'inject/injector.dart';
import 'navigator/navigator_mixin.dart';

abstract class BaseViewModel<M extends BaseModel> extends ChangeNotifier
    with BaseViewModelInterface, NavigatorMixin {
  int _loadNum = 0;
  int _minLoadNum = 1;
  BuildContext context;
  M model;
  bool _isDispose = false;

  bool get isDispose => _isDispose;

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
  }

  void sendEvent(dynamic event) {
    if (!_isDispose) {
      EventBus.instance.fire(event);
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _isDispose = true;
  // }


}
