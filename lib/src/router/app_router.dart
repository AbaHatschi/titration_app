import 'package:flutter/material.dart';

/// Represents the different routes/screens in the application.
/// Uses Dart's sealed classes to define a closed set of routes.
/// Each route is represented as a final class extending [AppRoute].
/// The [routeName] getter provides a string representation of the route.
/// Example usage:
/// ```dart
/// final route = DashboardRoute();
/// print(route.routeName); // Outputs: Dashboard
/// ```
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

/// Represents the Splash screen route.
/// This is the initial screen shown when the app starts.
final class SplashRoute extends AppRoute {
  const SplashRoute();
}

/// Represents the Dashboard screen route.
/// This is the main screen of the application after the splash screen.
final class DashboardRoute extends AppRoute {
  const DashboardRoute();
}

/// Represents the Settings screen route.
/// This screen allows users to configure app settings.
final class SettingsRoute extends AppRoute {
  const SettingsRoute();
}

/// Manages the application's routing state.
/// Uses [ChangeNotifier] to notify listeners of route changes.
/// Provides methods to navigate between different routes.
/// The current route can be accessed via the [currentRoute] getter.
/// Example usage:
/// ```dart
/// final appRouter = AppRouter();
/// appRouter.goToDashboard();
/// ```
class AppRouter extends ChangeNotifier {
  // The current active route in the application.
  AppRoute _currentRoute = const SplashRoute();

  /// Gets the current active route.
  /// Returns an instance of [AppRoute] representing the current screen.
  AppRoute get currentRoute => _currentRoute;

  /// A list of all available routes in the application.
  /// This can be used for route management and navigation.
  static const List<AppRoute> allRoutes = <AppRoute>[
    SplashRoute(),
    DashboardRoute(),
    SettingsRoute(),
  ];

  /// Navigates to the specified route.
  /// If the requested route is the same as the current route, no action is taken.
  /// Notifies listeners of route changes.
  Future<void> goToRoute(AppRoute route) async {
    // If the requested route is the same as the current route, do nothing.
    if (_currentRoute.runtimeType == route.runtimeType) {
      return;
    }

    // If the requested route is different from the current route, update the current route.
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

  // Convenience methods for navigating to specific routes.
  Future<void> goToSplash() => goToRoute(const SplashRoute());
  Future<void> goToDashboard() => goToRoute(const DashboardRoute());
  Future<void> goToSettings() => goToRoute(const SettingsRoute());

  /// Debug method to print the current route to the console.
  /// Useful for development and debugging purposes.
  void debugPrintCurrentRoute() {
    debugPrint('AppRouter is currently at: ${_currentRoute.routeName}');
  }
}
