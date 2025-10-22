import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/routing/app_router.dart';
import 'src/services/navigation_service.dart';
import 'src/titration_app.dart';
import 'src/ui/features/dashboard/view_model/dashboard_view_model.dart';
import 'src/ui/features/splash/view_model/splash_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        // Provide the AppRouter instance
        Provider<AppRouter>(create: (_) => AppRouter()),

        Provider<SplashRoute>(create: (_) => SplashRoute()),
        Provider<DashboardRoute>(create: (_) => DashboardRoute()),

        // Add your service providers here
        Provider<NavigationService>(
          create: (BuildContext context) => NavigationService(
            splashRoute: context.read<SplashRoute>(),
            dashboardRoute: context.read<DashboardRoute>(),
          ),
        ),

        // Add your repository providers here
        // Example: Provider(create: (_) => TitrationRepository()),

        // Add your view model providers here
        ChangeNotifierProvider<DashboardViewModel>(
          create: (BuildContext context) => DashboardViewModel(
            navigationService: context.read<NavigationService>(),
          ),
        ),
        ChangeNotifierProvider<SplashViewModel>(
          create: (BuildContext context) => SplashViewModel(
            navigationService: context.read<NavigationService>(),
          ),
        ),
      ],
      child: const TitrationApp(),
    ),
  );
}
