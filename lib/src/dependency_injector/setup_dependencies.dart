import '../controllers/line_controller.dart';
import '../router/app_router.dart';
import '../services/calculation_service.dart';
import '../services/database_service.dart';
import '../services/validation_service.dart';
import 'service_locator.dart' show ServiceLocator;

void setupDependencies(DatabaseService databaseService) {
  ServiceLocator.register<DatabaseService>('databaseService', databaseService);
  ServiceLocator.register<ValidationService>(
    'validationService',
    ValidationService(),
  );
  ServiceLocator.register<CalculationService>(
    'calculationService',
    CalculationService(),
  );

  ServiceLocator.register<AppRouter>('appRouter', AppRouter());

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
