part of '../cores.dart';

class LocalStorageManager {
  static const String appLanguage = "appLanguage";
  static const String isLoggedIn = "isLoggedIn";
  static const String themeMode = "themeMode";
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  set setAppLanguage(LanguageModel language) =>
      _prefs?.setString(appLanguage, jsonEncode(language));

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

  static LanguageModel get getAppLanguage {
    LanguageModel language;

    Map<String, dynamic> obj =
        jsonDecode(_prefs?.getString(appLanguage) ?? "");
    language = LanguageModel.fromJson(obj);

    return language;
  }

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
