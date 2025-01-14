import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../cores/cores.dart';
import '../../providers/providers.dart';
import '../../routes/routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.child,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('DashboardScreen'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final translate = context.translate;
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
            surfaceTintColor: colorScheme.primary,
            shadowColor: colorScheme.shadow,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? TextStyle(color: colorScheme.primary)
                  : TextStyle(color: colorScheme.onPrimary),
            ),
            indicatorColor: colorScheme.primary,
          ),
          child: NavigationBar(
            key: const Key("Dashbord Navigation Bar"),
            backgroundColor: colorScheme.surface,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(seconds: 3),
            selectedIndex: _calculateSelectedIndex(context),
            onDestinationSelected: (int? index) => _onTap(context, index ?? 0),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: colorScheme.onSurface),
                selectedIcon: Icon(Icons.home, color: colorScheme.onSurface),
                label: translate?.home ?? "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined,
                    color: colorScheme.onSurface),
                selectedIcon:
                    Icon(Icons.favorite, color: colorScheme.onSurface),
                label: translate?.favourite ?? "Favourite",
              ),
              NavigationDestination(
                icon: Icon(Icons.offline_bolt_outlined,
                    color: colorScheme.onSurface),
                selectedIcon:
                    Icon(Icons.offline_bolt, color: colorScheme.onSurface),
                label: translate?.offer ?? "Offers",
              ),
              NavigationDestination(
                icon: _buildCartNumberIcon(
                  icon: Icons.shopping_cart_outlined,
                  colorScheme: colorScheme,
                ),
                selectedIcon: _buildCartNumberIcon(
                  icon: Icons.shopping_cart,
                  colorScheme: colorScheme,
                ),
                label: translate?.cart ?? "Cart",
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline, color: colorScheme.onSurface),
                selectedIcon: Icon(Icons.person, color: colorScheme.onSurface),
                label: translate?.profile ?? "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartNumberIcon({
    required ColorScheme colorScheme,
    required IconData icon,
  }) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return Stack(
        children: [
          Icon(icon, color: colorScheme.onSurface),
          if (cartProvider.dishes.isNotEmpty)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "${cartProvider.totalQuantity}",
                  style: const TextStyle(fontSize: 11, color: AppColors.white),
                ),
              ),
            ),
        ],
      );
    });
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(RoutesName.home)) {
      return 0;
    }
    if (location.startsWith(RoutesName.favourite)) {
      return 1;
    }
    if (location.startsWith(RoutesName.offer)) {
      return 2;
    }
    if (location.startsWith(RoutesName.cart)) {
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
        GoRouter.of(context).go(RoutesName.favourite);
        break;
      case 2:
        GoRouter.of(context).go(RoutesName.offer);
        break;
      case 3:
        GoRouter.of(context).go(RoutesName.cart);
        break;
      case 4:
        GoRouter.of(context).go(RoutesName.profile);
        break;
    }
  }
}
