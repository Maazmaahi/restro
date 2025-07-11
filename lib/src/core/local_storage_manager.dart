part of 'core.dart';

class LocalStorageManager {
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs?.setBool(key, value) ?? false;

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs?.setDouble(key, value) ?? false;

  static Future<bool> setInt(String key, int value) async =>
      await _prefs?.setInt(key, value) ?? false;

  static Future<bool> setString(String key, String value) async =>
      await _prefs?.setString(key, value) ?? false;

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs?.setStringList(key, value) ?? false;

  //gets
  static bool getBool(String key) => _prefs?.getBool(key) ?? false;

  static double getDouble(String key) => _prefs?.getDouble(key) ?? 0;

  static int getInt(String key) => _prefs?.getInt(key) ?? 0;

  static String getString(String key) => _prefs?.getString(key) ?? "";

  static List<String> getStringList(String key) =>
      _prefs?.getStringList(key) ?? [];

  //deletes..
  static Future<bool> remove(String key) async =>
      await _prefs?.remove(key) ?? false;

  static Future<bool> clear() async => await _prefs?.clear() ?? false;
}