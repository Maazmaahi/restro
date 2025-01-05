import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/providers/providers.dart';
import 'package:restro/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => OfferProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Restro',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('hi'), // Hindi
          ],
          locale: authProvider.locale,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: authProvider.themeMode,
          routerConfig: AppRouter.router,
        );
      }),
    );
  }

  Locale getLocale(language) {
    switch (language) {
      case "english":
        return const Locale('en');
      case "hindi":
        return const Locale('hi');
      default:
        return const Locale('en');
    }
  }
}
