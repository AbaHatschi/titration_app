import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/provider_list.dart';
import 'src/titration_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services for dependency injection
  final SembastDatabase sembastDatabase = SembastDatabase();
  await sembastDatabase.initializeDatabase();
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  runApp(
    MultiProvider(
      providers: buildProviders(sembastDatabase, sharedPreferencesService),
      child: const TitrationApp(),
    ),
  );
}
