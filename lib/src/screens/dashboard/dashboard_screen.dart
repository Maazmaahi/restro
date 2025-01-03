import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/routes/routes.dart';
import 'package:restro/src/widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.child,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('DashboardScreen'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: const PreferredSize(
        //   preferredSize: Size.fromHeight(50),
        //   child: CustomAppBar(
        //     leftButton: CustomAppBarLeftButtons.none,
        //     title: "Restro",
        //   ),
        // ),
        body: child,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            elevation: 40,
            surfaceTintColor: AppColors.primary,
            shadowColor: AppColors.shadowColor,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? TextStyle(color: AppColors.primary)
                  : const TextStyle(color: Colors.black),
            ),
            iconTheme: WidgetStateProperty.resolveWith(
                (Set<WidgetState> states) =>
                    states.contains(WidgetState.selected)
                        ? IconThemeData(color: AppColors.primary)
                        : const IconThemeData(color: AppColors.steelBlue)),
            indicatorColor: AppColors.primary,
          ),
          child: NavigationBar(
            backgroundColor: AppColors.white,
            selectedIndex: _calculateSelectedIndex(context),
            onDestinationSelected: (int? index) => _onTap(context, index ?? 0),
            destinations: _navigationItems,
          ),
        ),
      ),
    );
  }

  static const _navigationItems = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined, color: Colors.black),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(Icons.wallet, color: Colors.black),
      label: "Recharge",
    ),
    NavigationDestination(
      icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
      label: "Favourite",
    ),
    NavigationDestination(
      icon: Icon(Icons.offline_bolt_outlined, color: Colors.black),
      label: "Offers",
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline, color: Colors.black),
      label: "Profile",
    ),
  ];

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(RoutesName.home)) {
      return 0;
    }
    if (location.startsWith(RoutesName.recharge)) {
      return 1;
    }
    if (location.startsWith(RoutesName.favourite)) {
      return 2;
    }
    if (location.startsWith(RoutesName.offer)) {
      return 3;
    }
    if (location.startsWith(RoutesName.profile)) {
      return 4;
    }

    return 0;
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RoutesName.home);
        break;
      case 1:
        GoRouter.of(context).go(RoutesName.recharge);
        break;
      case 2:
        GoRouter.of(context).go(RoutesName.favourite);
        break;
      case 3:
        GoRouter.of(context).go(RoutesName.offer);
        break;
      case 4:
        GoRouter.of(context).go(RoutesName.profile);
        break;
    }
  }
}
