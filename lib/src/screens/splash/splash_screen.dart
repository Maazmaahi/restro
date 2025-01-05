import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/routes/routes.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    super.initState();

    final isLoggedIn =
        LocalStorageManager.getBool(LocalStorageManager.isLoggedIn);
    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn) {
        context.go(RoutesName.home);
      } else {
        context.go(RoutesName.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    final translate = context.translate;

    return AppScaffold(
      body: Center(
        child: Text(translate?.biryaniMahal ?? "Biryani Mahal"),
      ),
    );
  }
}
