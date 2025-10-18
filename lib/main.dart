import 'package:flutter/material.dart';

import 'src/dependency_injector/setup_dependencies.dart';
import 'src/services/database_service.dart';
import 'src/titration_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final DatabaseService databaseService = DatabaseService();
  await databaseService.initialize();

  setupDependencies(databaseService);

  runApp(const TitrationApp());
}
