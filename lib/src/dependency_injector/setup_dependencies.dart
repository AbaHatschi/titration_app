import '../controllers/line_controller.dart';
import '../router/app_router.dart';
import '../services/calculation_service.dart';
import '../services/database_service.dart';
import '../services/validation_service.dart';
import 'service_locator.dart' show ServiceLocator;

/// Sets up the dependencies for the application using the provided [databaseService].
/// This function registers various services and controllers in the [ServiceLocator].
/// [databaseService] is passed as a parameter to allow for flexibility in testing
/// and different implementations.
/// Example usage:
/// ```dart
/// final databaseService = DatabaseService();
/// setupDependencies(databaseService);
/// ```
/// This setup allows for easy retrieval of services and controllers throughout the app.
void setupDependencies(DatabaseService databaseService) {

  // Register services
  ServiceLocator.register<DatabaseService>('databaseService', databaseService);
  ServiceLocator.register<ValidationService>(
    'validationService',
    ValidationService(),
  );
  ServiceLocator.register<CalculationService>(
    'calculationService',
    CalculationService(),
  );

  // Register router
  ServiceLocator.register<AppRouter>('appRouter', AppRouter());

  // Register line controllers
  ServiceLocator.register<LineController>(
    'lineOneController',
    LineController(
      lineName: 'LineOne',
      validationService: ServiceLocator.get<ValidationService>(
        'validationService',
      ),
      calculationService: ServiceLocator.get<CalculationService>(
        'calculationService',
      ),
      databaseService: databaseService,
    ),
  );

  ServiceLocator.register<LineController>(
    'lineTwoController',
    LineController(
      lineName: 'LineTwo',
      validationService: ServiceLocator.get<ValidationService>(
        'validationService',
      ),
      calculationService: ServiceLocator.get<CalculationService>(
        'calculationService',
      ),
      databaseService: databaseService,
    ),
  );

  ServiceLocator.register<LineController>(
    'kegLineController',
    LineController(
      lineName: 'KegLine',
      validationService: ServiceLocator.get<ValidationService>(
        'validationService',
      ),
      calculationService: ServiceLocator.get<CalculationService>(
        'calculationService',
      ),
      databaseService: databaseService,
    ),
  );
}
