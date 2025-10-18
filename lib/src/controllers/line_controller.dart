import '../models/line_configuration.dart';
import '../services/calculation_service.dart';
import '../services/database_service.dart';
import '../services/validation_service.dart';

/// Controller responsible for processing titration data for a specific line.
/// Parameters:
/// - [lineName]: The name of the line (e.g., 'LineOne', 'LineTwo', 'KegLine').
/// - [validationService]: Service for validating input and calculated values.
/// - [calculationService]: Service for performing titration calculations.
/// - [databaseService]: Service for saving and retrieving measurements from the database.
class LineController {
  LineController({
    required this.lineName,
    required this.validationService,
    required this.calculationService,
    required this.databaseService,
  });

  // Line identifier
  final String lineName;

  // Services
  final ValidationService validationService;
  final CalculationService calculationService;
  final DatabaseService databaseService;

  /// Processes a lye titration.
  /// Parameters:
  /// - [pValue]: The p-value from the titration.
  /// - [mValue]: The m-value from the titration.
  /// - [substanceName]: Name of the substance (e.g., 'Lye').
  /// - [lineConfig]: Configuration for the specific line, including tolerances.
  ///
  /// Returns a [ProcessLyeResult] indicating the outcome of the processing.
  Future<ProcessLyeResult> processLyeTitration({
    required double pValue,
    required double mValue,
    required String substanceName,
    required LineConfiguration lineConfig,
  }) async {
    // Validate input values
    if (!validationService.isValidPValue(pValue)) {
      return ProcessLyeResult.failed(
        reason: 'Invalid p-value: must be between 0 and 25',
      );
    }

    // Validate m-value
    if (!validationService.isValidMValue(mValue, pValue)) {
      return ProcessLyeResult.failed(
        reason: 'Invalid m-value: must be greater than p-value and <= 25',
      );
    }

    // Perform calculations
    final LyeCalculationResult calculationResult = calculationService
        .calculateLye(pValue: pValue, mValue: mValue);

    // Validate calculated concentration
    if (!validationService.isValidConcentration(
      calculationResult.concentration,
      substanceName,
      lineConfig,
    )) {
      // Determine tolerance status
      final ToleranceStatus status = validationService.getToleranceStatus(
        calculationResult.concentration,
        substanceName,
        lineConfig,
      );

      return ProcessLyeResult.outOfTolerance(
        concentration: calculationResult.concentration,
        soda: calculationResult.soda,
        status: status,
      );
    }

    // Validate soda value
    if (!validationService.isValidSoda(
      calculationResult.soda,
      calculationResult.concentration,
    )) {
      return ProcessLyeResult.failed(
        reason: 'Soda value is not less than concentration',
      );
    }

    // Save measurement to database
    try {
      await databaseService.saveLyeMeasurement(
        line: lineName,
        substanceName: substanceName,
        pValue: pValue,
        mValue: mValue,
        concentration: calculationResult.concentration,
        soda: calculationResult.soda,
      );
    } catch (e) {
      return ProcessLyeResult.failed(reason: 'Failed to save: $e');
    }

    return ProcessLyeResult.success(
      concentration: calculationResult.concentration,
      soda: calculationResult.soda,
    );
  }

  /// Processes an acid titration.
  /// Parameters:
  /// - [mValue]: The m-value from the titration.
  /// - [substanceName]: Name of the substance (e.g., 'Acid').
  /// - [lineConfig]: Configuration for the specific line, including tolerances.
  ///
  /// Returns a [ProcessAcidResult] indicating the outcome of the processing.
  Future<ProcessAcidResult> processAcidTitration({
    required double mValue,
    required String substanceName, // z.B. 'Acid'
    required LineConfiguration lineConfig,
  }) async {
    // Validate m-value
    if (!validationService.isValueInInputRange(mValue)) {
      return ProcessAcidResult.failed(
        reason: 'Invalid m-value: must be between 0 and 25',
      );
    }

    // Perform calculations
    final double concentration = calculationService.calculateAcid(
      mValue: mValue,
    );

    // Validate calculated concentration
    if (!validationService.isValidConcentration(
      concentration,
      substanceName,
      lineConfig,
    )) {
      // Determine tolerance status
      final ToleranceStatus status = validationService.getToleranceStatus(
        concentration,
        substanceName,
        lineConfig,
      );

      return ProcessAcidResult.outOfTolerance(
        concentration: concentration,
        status: status,
      );
    }

    // Save measurement to database
    try {
      await databaseService.saveAcidMeasurement(
        line: lineName,
        substanceName: substanceName,
        mValue: mValue,
        concentration: concentration,
      );
    } catch (e) {
      return ProcessAcidResult.failed(reason: 'Failed to save: $e');
    }

    return ProcessAcidResult.success(concentration: concentration);
  }
}

/// Result of processing a lye titration.
sealed class ProcessLyeResult {
  const ProcessLyeResult();

  /// Creates a success result with the calculated concentration and soda values.
  /// Parameters:
  /// - [concentration]: The calculated concentration.
  /// - [soda]: The calculated soda value.
  ///
  /// Returns a [ProcessLyeResult] representing a successful titration.
  factory ProcessLyeResult.success({
    required double concentration,
    required double soda,
  }) => _SuccessLye(concentration: concentration, soda: soda);

  /// Creates an out-of-tolerance result with the calculated concentration, soda values, and tolerance status.
  /// Parameters:
  /// - [concentration]: The calculated concentration.
  /// - [soda]: The calculated soda value.
  /// - [status]: The tolerance status.
  ///
  /// Returns a [ProcessLyeResult] representing an out-of-tolerance titration.
  factory ProcessLyeResult.outOfTolerance({
    required double concentration,
    required double soda,
    required ToleranceStatus status,
  }) => _OutOfToleranceLye(
    concentration: concentration,
    soda: soda,
    status: status,
  );

  /// Creates a failed result with a reason for the failure.
  /// Parameters:
  /// - [reason]: The reason for the failure.
  ///
  /// Returns a [ProcessLyeResult] representing a failed titration.
  factory ProcessLyeResult.failed({required String reason}) =>
      _FailedLye(reason: reason);
}

/// Success result for lye titration processing.
/// Parameters:
/// - [concentration]: The calculated concentration.
/// - [soda]: The calculated soda value.
final class _SuccessLye extends ProcessLyeResult {
  const _SuccessLye({required this.concentration, required this.soda});
  final double concentration;
  final double soda;
}

/// Out-of-tolerance result for lye titration processing.
/// Parameters:
/// - [concentration]: The calculated concentration.
/// - [soda]: The calculated soda value.
/// - [status]: The tolerance status.
final class _OutOfToleranceLye extends ProcessLyeResult {
  const _OutOfToleranceLye({
    required this.concentration,
    required this.soda,
    required this.status,
  });
  final double concentration;
  final double soda;
  final ToleranceStatus status;
}

/// Failed result for lye titration processing.
/// Parameters:
/// - [reason]: The reason for the failure.
final class _FailedLye extends ProcessLyeResult {
  const _FailedLye({required this.reason});
  final String reason;
}

/// Result of processing an acid titration.
sealed class ProcessAcidResult {
  const ProcessAcidResult();

  /// Creates a success result with the calculated concentration.
  /// Parameters:
  /// - [concentration]: The calculated concentration.
  ///
  /// Returns a [ProcessAcidResult] representing a successful titration.
  factory ProcessAcidResult.success({required double concentration}) =>
      _SuccessAcid(concentration: concentration);

  /// Creates an out-of-tolerance result with the calculated concentration and tolerance status.
  /// Parameters:
  /// - [concentration]: The calculated concentration.
  /// - [status]: The tolerance status.
  ///
  /// Returns a [ProcessAcidResult] representing an out-of-tolerance titration.
  factory ProcessAcidResult.outOfTolerance({
    required double concentration,
    required ToleranceStatus status,
  }) => _OutOfToleranceAcid(concentration: concentration, status: status);

  /// Creates a failed result with a reason for the failure.
  /// Parameters:
  /// - [reason]: The reason for the failure.
  ///
  /// Returns a [ProcessAcidResult] representing a failed titration.
  factory ProcessAcidResult.failed({required String reason}) =>
      _FailedAcid(reason: reason);
}

/// Success result for acid titration processing.
/// Parameters:
/// - [concentration]: The calculated concentration.
final class _SuccessAcid extends ProcessAcidResult {
  const _SuccessAcid({required this.concentration});
  final double concentration;
}

/// Out-of-tolerance result for acid titration processing.
/// Parameters:
/// - [concentration]: The calculated concentration.
/// - [status]: The tolerance status.
final class _OutOfToleranceAcid extends ProcessAcidResult {
  const _OutOfToleranceAcid({
    required this.concentration,
    required this.status,
  });
  final double concentration;
  final ToleranceStatus status;
}

/// Failed result for acid titration processing.
/// Parameters:
/// - [reason]: The reason for the failure.
final class _FailedAcid extends ProcessAcidResult {
  const _FailedAcid({required this.reason});
  final String reason;
}
