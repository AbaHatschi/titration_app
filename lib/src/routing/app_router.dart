import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/features/dashboard/widgets/dashboard_view.dart';
import '../ui/features/splash/widgets/splash_view.dart';
import 'route_path.dart';

part 'app_router.g.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    initialLocation: RoutePath.splash,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}

@TypedGoRoute<SplashRoute>(path: RoutePath.splash)
class SplashRoute extends GoRouteData with $SplashRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

@TypedGoRoute<DashboardRoute>(path: RoutePath.dashboard)
class DashboardRoute extends GoRouteData with $DashboardRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardView();
  }
}
