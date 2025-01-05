part of '../providers.dart';

class AuthProvider extends BaseProvider {
  final AuthRepository _authRepository = AuthRepository();
  final languages = <LanguageModel>[];
  final themes = <ThemeModel>[];

  /// Language
  Locale _locale = const Locale('en');

  Locale get locale => _locale;
  static const languageCodeKey = "languageCode";
  String localeGroupValue = 'en';

  /// Theme
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;
  static const themeKey = "themeKey";
  String themeGroupValue = 'system';

  Future<void> initializeData() async {
    languages.clear();
    themes.clear();
  }

  Future<void> getLanguages() async {
    setState(ViewState.busy);
    if (languages.isEmpty) {
      final results = await _authRepository.getLanguages();
      languages.addAll(results);
    }
    setState(ViewState.idle);
  }

  Future<void> getThemes() async {
    setState(ViewState.busy);
    if (themes.isEmpty) {
      final results = await _authRepository.getThemes();
      themes.addAll(results);
    }
    setState(ViewState.idle);
  }

  init() async {
    _themeMode = await getTheme();
    _locale = await getLocale();
  }

  void setLocale(Locale locale) {
    setState(ViewState.busy);
    if (locale == _locale) {
      return;
    }
    _locale = locale;
    saveLocale(locale);
    setState(ViewState.idle);
  }

  saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(languageCodeKey, locale.languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(languageCodeKey) ?? "en";
    localeGroupValue = languageCode;
    return Locale(languageCode);
  }

  void setTheme(ThemeModel themeModel) {
    setState(ViewState.busy);
    if (_themeMode == getThemeModeByString(themeModel.code)) {
      return;
    }
    _themeMode = getThemeModeByString(themeModel.code);
    saveTheme(themeModel);
    setState(ViewState.idle);
  }

  saveTheme(ThemeModel themeModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, themeModel.code);
  }

  Future<ThemeMode> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString(themeKey) ?? "system";
    themeGroupValue = theme;
    return getThemeModeByString(theme);
  }

  ThemeMode getThemeModeByString(code) {
    switch (code) {
      case "system":
        return ThemeMode.system;
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
