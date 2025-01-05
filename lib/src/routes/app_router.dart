part of 'routes.dart';

class AppRouter {
  static GoRouter get router => _router;

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  static GlobalKey<NavigatorState> get mainMenuNavigatorKey =>
      _mainMenuNavigatorKey;

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _mainMenuNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main-menu');

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _mainMenuNavigatorKey,
        builder: (_, __, child) {
          return DashboardScreen(child: child);
          // return AppNavBar(child: child);
        },
        routes: <RouteBase>[
          ...BottomNavRoutes.mainMenuRoutes,
        ],
      ),
      // GoRoute(
      //   name: RoutesName.dashboard,
      //   path: RoutesName.dashboard,
      //   builder: (BuildContext context, GoRouterState state) {
      //     final Widget child = state.extra! as Widget;
      //     return DashboardScreen(
      //       child: child,
      //     );
      //   },
      // ),
      GoRoute(
        name: RoutesName.address,
        path: RoutesName.address,
        builder: (BuildContext context, GoRouterState state) {
          return const AddressScreen();
        },
      ),
      GoRoute(
        name: RoutesName.dishDetails,
        path: RoutesName.dishDetails,
        builder: (BuildContext context, GoRouterState state) {
          // final DishModel dish = state.extra! as DishModel;

          final Map<String, dynamic> extra =
              state.extra! as Map<String, dynamic>;
          final DishModel dish = extra['dish'] as DishModel;
          final bool showOtherDishesMayLike =
              extra['showOtherDishesMayLike'] as bool;
          return DishDetailsScreen(
            dish: dish,
            showOtherDishesMayLike: showOtherDishesMayLike,
          );
        },
      ),
      GoRoute(
        name: RoutesName.exploreMenu,
        path: RoutesName.exploreMenu,
        builder: (BuildContext context, GoRouterState state) {
          return const ExploreMenuScreen();
        },
      ),
      GoRoute(
        name: RoutesName.location,
        path: RoutesName.location,
        builder: (BuildContext context, GoRouterState state) {
          return const LocationScreen();
        },
      ),
      GoRoute(
        name: RoutesName.login,
        path: RoutesName.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: RoutesName.notifications,
        path: RoutesName.notifications,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationsScreen();
        },
      ),
      GoRoute(
        name: RoutesName.order,
        path: RoutesName.order,
        builder: (BuildContext context, GoRouterState state) {
          return const OrderScreen();
        },
      ),
      GoRoute(
        name: RoutesName.otp,
        path: RoutesName.otp,
        builder: (BuildContext context, GoRouterState state) {
          return const OtpScreen();
        },
      ),

      GoRoute(
        name: RoutesName.register,
        path: RoutesName.register,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),

      GoRoute(
        name: RoutesName.search,
        path: RoutesName.search,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        name: RoutesName.splash,
        path: RoutesName.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
    ],
  );
}
