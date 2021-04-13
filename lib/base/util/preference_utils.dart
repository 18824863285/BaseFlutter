import 'package:shared_preferences/shared_preferences.dart';

/// shared_preferences 管理类
class PreferenceUtils {
  static PreferenceUtils? _instance;

  static PreferenceUtils get instance => PreferenceUtils();

  PreferenceUtils._internal();

  late SharedPreferences _sharedPreferences;

  factory PreferenceUtils() {
    if (_instance == null) _instance = PreferenceUtils._internal();
    return _instance!;
  }

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  saveInteger(String key, int value) => _sharedPreferences.setInt(key, value);

  saveString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  saveBool(String key, bool value) => _sharedPreferences.setBool(key, value);

  saveDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  saveStringList(String key, List<String> value) =>
      _sharedPreferences.setStringList(key, value);

  int getInteger(String key, [int defaultValue = 0]) {
    var value = _sharedPreferences.getInt(key);
    return value ?? defaultValue;
  }

  String getString(String key, [String defaultValue = '']) {
    var value = _sharedPreferences.getString(key);
    return value ?? defaultValue;
  }

  bool getBool(String key, [bool defaultValue = false]) {
    var value = _sharedPreferences.getBool(key);
    return value ?? defaultValue;
  }

  double getDouble(String key, [double defaultValue = 0.0]) {
    var value = _sharedPreferences.getDouble(key);
    return value ?? defaultValue;
  }

  List<String> getStringList(String key,
      [List<String> defaultValue = const <String>[]]) {
    var value = _sharedPreferences.getStringList(key);
    return value ?? defaultValue;
  }

  void clear(){
    _sharedPreferences.clear();
  }
}
