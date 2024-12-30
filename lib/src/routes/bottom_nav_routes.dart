part of 'routes.dart';

class BottomNavRoutes {
  static final mainMenuRoutes = <RouteBase>[
    GoRoute(
      name: RoutesName.home,
      path: RoutesName.home,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.recharge,
      path: RoutesName.recharge,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const RechargeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.favourite,
      path: RoutesName.favourite,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const FavouriteScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.offer,
      path: RoutesName.offer,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const OfferScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.profile,
      path: RoutesName.profile,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const ProfileScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ].toList(growable: false);
}
