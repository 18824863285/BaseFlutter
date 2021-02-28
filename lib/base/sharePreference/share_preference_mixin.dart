import 'package:wan_android_flutter/base/util/preference_utils.dart';

mixin SharePreferenceMixin {

  void saveSpInteger(String key, int value){
    PreferenceUtils.instance.saveInteger(key, value);
  }

  void saveSpString(String key, String value){
    PreferenceUtils.instance.saveString(key, value);
  }

}
