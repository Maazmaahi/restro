part of '../cores.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppLocalizations? get translate => AppLocalizations.of(this);

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  void maybePop<T extends Object?>([T? result]) async {
    if (!canPop()) return;
    return pop<T>(result);
  }

  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
