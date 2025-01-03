import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final isLoggedIn = LocalStorageManager.getBool("isLoggedIn");
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
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Restro"),
        ),
      ),
    );
  }
}
