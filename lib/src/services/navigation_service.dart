import 'package:flutter/material.dart';

import '../routing/app_router.dart';

class NavigationService {
  NavigationService({
    required SplashRoute splashRoute,
    required DashboardRoute dashboardRoute,
  }) : _splashRoute = splashRoute,
       _dashboardRoute = dashboardRoute;

  final SplashRoute _splashRoute;
  final DashboardRoute _dashboardRoute;

  void navigateToSplash(BuildContext context) => _splashRoute.go(context);

  void navigateToDashboard(BuildContext context) => _dashboardRoute.go(context);
}
