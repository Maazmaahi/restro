part of 'repositories.dart';

class AuthRepository {
  Future<List<LanguageModel>> getLanguages() async {
    final languages = <LanguageModel>[];
    languages
      ..clear()
      ..addAll(List<LanguageModel>.from(
          languagesJSON.map((e) => LanguageModel.fromJson(e))));
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return languages;
  }

  Future<List<ThemeModel>> getThemes() async {
    final themes = <ThemeModel>[];
    themes
      ..clear()
      ..addAll(
          List<ThemeModel>.from(themeJSON.map((e) => ThemeModel.fromJson(e))));
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return themes;
  }
}
