import 'package:flutter/material.dart';

import 'src/dependency_injector/setup_dependencies.dart';
import 'src/services/database_service.dart';
import 'src/titration_app.dart';

/// The main entry point of the Titration Application.
/// Initializes necessary services and runs the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database service
  final DatabaseService databaseService = DatabaseService();
  await databaseService.initialize();

  // Setup dependency injection
  setupDependencies(databaseService);

  runApp(const TitrationApp());
}
