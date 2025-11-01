// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $dashboardRoute,
  $kegLineRoute,
  $lineOneRoute,
  $lineTwoRoute,
];

RouteBase get $splashRoute =>
    GoRouteData.$route(path: '/splash', factory: $SplashRoute._fromState);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  @override
  String get location => GoRouteData.$location('/splash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardRoute =>
    GoRouteData.$route(path: '/dashboard', factory: $DashboardRoute._fromState);

mixin $DashboardRoute on GoRouteData {
  static DashboardRoute _fromState(GoRouterState state) => DashboardRoute();

  @override
  String get location => GoRouteData.$location('/dashboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $kegLineRoute =>
    GoRouteData.$route(path: '/kegLine', factory: $KegLineRoute._fromState);

mixin $KegLineRoute on GoRouteData {
  static KegLineRoute _fromState(GoRouterState state) => KegLineRoute();

  @override
  String get location => GoRouteData.$location('/kegLine');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lineOneRoute =>
    GoRouteData.$route(path: '/lineOne', factory: $LineOneRoute._fromState);

mixin $LineOneRoute on GoRouteData {
  static LineOneRoute _fromState(GoRouterState state) => LineOneRoute();

  @override
  String get location => GoRouteData.$location('/lineOne');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lineTwoRoute =>
    GoRouteData.$route(path: '/lineTwo', factory: $LineTwoRoute._fromState);

mixin $LineTwoRoute on GoRouteData {
  static LineTwoRoute _fromState(GoRouterState state) => LineTwoRoute();

  @override
  String get location => GoRouteData.$location('/lineTwo');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
