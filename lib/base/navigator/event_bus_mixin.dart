import 'package:wan_android_flutter/base/event_bus/event_bus.dart';

mixin EventBusMixin {
  bool _isDispose = false;

  void setIsDispose(bool isDispose) {
    this._isDispose = isDispose;
  }

  void sendEvent(dynamic event) {
    if (!_isDispose) {
      EventBus.instance.fire(event);
    }
  }
}
