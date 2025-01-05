part of '../providers.dart';

class LanguageProvider extends BaseProvider {
  final authRepository = AuthRepository();
  List<LanguageModel> languages = [];

  Locale _locale = const Locale('en');

  Locale get locale => _locale;
  static const languageCodeKey = "languageCode";
  String groupValue = 'en';

  void setLocale(Locale locale) {
    log("LP :- setLocale :- i am here... ${locale.languageCode}");
    setState(ViewState.busy);
    if (locale == _locale) {
      return;
    }
    _locale = locale;
    saveLocale(locale);
    log("LP :- setLocale :- ${locale.languageCode}");
    setState(ViewState.idle);
  }

  init() {
    getLocale().then((value) {
      setState(ViewState.busy);
      _locale = value;
      log("LP :- init :- ${value.languageCode}");
      setState(ViewState.idle);
    });
  }

  saveLocale(Locale locale) async {
    log("LP :- saveLocale :- i am here... ${locale.languageCode}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(languageCodeKey, locale.languageCode);
    log("LP :- saveLocale :- ${locale.languageCode}");
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(languageCodeKey) ?? "en";
    log("LP :- getLocale :- $languageCode");
    return Locale(languageCode);
  }

  Future<void> getLanguages() async {
    setState(ViewState.busy);
    if (languages.isEmpty) {
      final result = await authRepository.getLanguages();
      languages.addAll(result);
    }
    setState(ViewState.idle);
  }
}
