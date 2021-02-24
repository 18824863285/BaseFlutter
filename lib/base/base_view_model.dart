import 'package:flutter/cupertino.dart';
import 'BaseViewModelInterface.dart';
import 'base_model.dart';
import 'event_bus/event_bus.dart';
import 'inject/injector.dart';

abstract class BaseViewModel<M extends BaseModel> extends ChangeNotifier
    with BaseViewModelInterface {
  int _loadNum = 0;
  int _minLoadNum = 1;
  M model;
  bool _isDispose = false;

  bool get isDispose => _isDispose;

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
  }

  set minLoadNum(int value) {
    _minLoadNum = value;
  }

  set loadNum(int value) {
    _loadNum = value;
  }

  void sendEvent(dynamic event) {
    if (!_isDispose) {
      EventBus.instance.fire(event);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
  }
}
