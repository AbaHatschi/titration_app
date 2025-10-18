import 'package:flutter/material.dart';

sealed class AppRoute {
  const AppRoute();

  String get routeName {
    return switch (this) {
      SplashRoute() => 'Splash',
      DashboardRoute() => 'Dashboard',
      SettingsRoute() => 'Settings',
    };
  }
}

final class SplashRoute extends AppRoute {
  const SplashRoute();
}

final class DashboardRoute extends AppRoute {
  const DashboardRoute();
}

final class SettingsRoute extends AppRoute {
  const SettingsRoute();
}

class AppRouter extends ChangeNotifier {
  AppRoute _currentRoute = const SplashRoute();

  AppRoute get currentRoute => _currentRoute;

  static const List<AppRoute> allRoutes = <AppRoute>[
    SplashRoute(),
    DashboardRoute(),
    SettingsRoute(),
  ];

  Future<void> goToRoute(AppRoute route) async {
    if (_currentRoute.runtimeType == route.runtimeType) {
      return;
    }

    switch (route) {
      case SplashRoute():
        _currentRoute = route;

      case DashboardRoute():
        _currentRoute = route;

      case SettingsRoute():
        _currentRoute = route;
    }

    notifyListeners();
  }

  Future<void> goToSplash() => goToRoute(const SplashRoute());
  Future<void> goToDashboard() => goToRoute(const DashboardRoute());
  Future<void> goToSettings() => goToRoute(const SettingsRoute());

  void debugPrintCurrentRoute() {
    debugPrint('AppRouter ist aktuell bei: ${_currentRoute.routeName}');
  }
}
