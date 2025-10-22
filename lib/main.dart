import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/routing/app_router.dart';
import 'src/titration_app.dart';
import 'src/ui/features/dashboard/view_model/dashboard_view_model.dart';
import 'src/ui/features/splash/view_model/splash_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        // Provide the AppRouter instance
        Provider<AppRouter>(create: (_) => AppRouter()),

        // Add your service providers here
        // Example: Provider(create: (_) => ApiService()),

        // Add your repository providers here
        // Example: Provider(create: (_) => TitrationRepository()),

        // Add your view model providers here
        ChangeNotifierProvider<DashboardViewModel>(
          create: (BuildContext context) => DashboardViewModel(),
        ),
        ChangeNotifierProvider<SplashViewModel>(
          create: (BuildContext context) => SplashViewModel(),
        ),
      ],
      child: const TitrationApp(),
    ),
  );
}
