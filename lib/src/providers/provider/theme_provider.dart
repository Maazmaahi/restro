part of '../providers.dart';

class ThemeProvider extends BaseProvider {
  final authRepository = AuthRepository();
  List<ThemeModel> themes = [];
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  static const themeKey = "themeKey";


  void setTheme(themeMode) async {
    setState(ViewState.busy);
    await LocalStorageManager.setString(
        LocalStorageManager.themeMode, getStringThemeMode(themeMode));
    _themeMode = themeMode;
    setState(ViewState.idle);
  }

  String getStringThemeMode(themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return "system";
      case ThemeMode.light:
        return "light";
      case ThemeMode.dark:
        return "dark";
      default:
        return "system";
    }
  }
}
