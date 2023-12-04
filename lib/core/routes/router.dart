import 'package:exe_test/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    name: '/',
    pageBuilder: (context, state) => buildWithFadetTransition(
      context: context,
      state: state,
      child: const SplashScreen(),
    ),
  )
]);

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
