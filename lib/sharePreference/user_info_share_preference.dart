import 'package:wan_android_flutter/base/util/preference_utils.dart';

class UserInfoSp {
  // ignore: non_constant_identifier_names
  static final String ID = "uid";
  static final String TOKEN = "token";
  static final String USER_NAME = "userName";

  PreferenceUtils _preferenceUtils = PreferenceUtils.instance;

  static UserInfoSp _instance;

  UserInfoSp._internal();

  factory UserInfoSp.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = UserInfoSp._internal();
    }
    return _instance;
  }

  int _uid;

  get uid => _preferenceUtils.getInteger(ID);

  set uid(int value) => _preferenceUtils.saveInteger(ID, value);

  String _token;

  get token => _preferenceUtils.getString(TOKEN);

  set token(String value) => _preferenceUtils.saveString(TOKEN, value);

  String _userName;

  get userName => _preferenceUtils.getString(USER_NAME);

  set userName(String value) => _preferenceUtils.saveString(USER_NAME, value);

}
