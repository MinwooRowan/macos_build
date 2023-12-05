import 'package:exe_test/presentation/screens/home/home_screen.dart';
import 'package:exe_test/presentation/screens/login/login_screen.dart';
import 'package:exe_test/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/${SplashScreen.routeName}',
  routes: <RouteBase>[
    GoRoute(
      path: '/${SplashScreen.routeName}',
      name: SplashScreen.routeName,
      pageBuilder: (context, state) => buildWithFadetTransition(
        context: context,
        state: state,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/${LoginScreen.routeName}',
      name: LoginScreen.routeName,
      pageBuilder: (context, state) => buildWithFadetTransition(
        context: context,
        state: state,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/${HomeScreen.routeName}',
      name: HomeScreen.routeName,
      pageBuilder: (context, state) => buildWithFadetTransition(
        context: context,
        state: state,
        child: const HomeScreen(),
      ),
    ),
  ],
);

CustomTransitionPage buildWithFadetTransition({
  int duration = 300,
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: Duration(milliseconds: duration),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
