import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/data/repositories/i_repository.dart';
import 'src/data/repositories/keg_line_repository.dart';
import 'src/data/repositories/line_one_repository.dart';
import 'src/data/repositories/line_two_repository.dart';
import 'src/data/services/sembast_service.dart';
import 'src/data/services/shared_preferences_service.dart';
import 'src/domain/keg_line_entity.dart';
import 'src/domain/line_one_entity.dart';
import 'src/domain/line_two_entity.dart';
import 'src/routing/app_router.dart';
import 'src/titration_app.dart';
import 'src/ui/features/dashboard/view_model/dashboard_view_model.dart';
import 'src/ui/features/keg_line/view_model/keg_line_view_model.dart';
import 'src/ui/features/line_one/view_model/line_one_view_model.dart';
import 'src/ui/features/line_two/view_model/line_two_view_model.dart';
import 'src/ui/features/splash/view_model/splash_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services for dependency injection
  final SembastService sembastService = SembastService();
  await sembastService.init();
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        // Provide the AppRouter instance
        Provider<AppRouter>(create: (_) => AppRouter()),

        // Add your service providers here
        Provider<SembastService>.value(value: sembastService),
        Provider<SharedPreferencesService>.value(
          value: sharedPreferencesService,
        ),

        // Add your repository providers here
        Provider<IRepository<KegLineEntity>>(
          create: (_) => KegLineRepository(sembastService: sembastService),
        ),
        Provider<IRepository<LineOneEntity>>(
          create: (_) => LineOneRepository(sembastService: sembastService),
        ),
        Provider<IRepository<LineTwoEntity>>(
          create: (_) => LineTwoRepository(sembastService: sembastService),
        ),

        // Add your view model providers here
        ChangeNotifierProvider<SplashViewModel>(
          create: (BuildContext context) => SplashViewModel(),
        ),
        ChangeNotifierProvider<DashboardViewModel>(
          create: (BuildContext context) => DashboardViewModel(),
        ),
        ChangeNotifierProvider<KegLineViewModel>(
          create: (BuildContext context) => KegLineViewModel(
            repository: context.read<IRepository<KegLineEntity>>(),
          ),
        ),
        ChangeNotifierProvider<LineOneViewModel>(
          create: (BuildContext context) => LineOneViewModel(
            repository: context.read<IRepository<LineOneEntity>>(),
          ),
        ),
        ChangeNotifierProvider<LineTwoViewModel>(
          create: (BuildContext context) => LineTwoViewModel(
            repository: context.read<IRepository<LineTwoEntity>>(),
          ),
        ),
      ],
      child: const TitrationApp(),
    ),
  );
}
