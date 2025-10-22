import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/features/dashboard/widgets/dashboard_view.dart';
import '../ui/features/splash/widgets/splash_view.dart';
import 'route_path.dart';

class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  void go(BuildContext context) => context.goNamed(RoutePath.splash);

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashView();
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  void go(BuildContext context) => context.goNamed(RoutePath.dashboard);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardView();
}
