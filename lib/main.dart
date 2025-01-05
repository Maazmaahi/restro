import 'package:flutter/material.dart';
import 'package:restro/src/app.dart';
import 'package:restro/src/cores/cores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageManager.init();
  final appLanguage = LocalStorageManager.getString(LocalStorageManager.appLanguage);
  final themeMode = LocalStorageManager.getString(LocalStorageManager.themeMode);
  runApp(MyApp());
}
