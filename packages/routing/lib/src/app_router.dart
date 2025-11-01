import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'route_path.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    initialLocation: RoutePath.splash,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}
