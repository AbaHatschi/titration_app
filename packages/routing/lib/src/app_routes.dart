import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keg_line/keg_line.dart';
import 'package:line_one/line_one.dart';
import 'package:line_two/line_two.dart';
import 'package:splash/splash.dart';

import 'route_path.dart';

part 'app_routes.g.dart';

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

@TypedGoRoute<KegLineRoute>(path: RoutePath.kegLine)
class KegLineRoute extends GoRouteData with $KegLineRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const KegLineView();
  }
}

@TypedGoRoute<LineOneRoute>(path: RoutePath.lineOne)
class LineOneRoute extends GoRouteData with $LineOneRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LineOneView();
  }
}

@TypedGoRoute<LineTwoRoute>(path: RoutePath.lineTwo)
class LineTwoRoute extends GoRouteData with $LineTwoRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LineTwoView();
  }
}
