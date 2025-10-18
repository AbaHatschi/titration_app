import '../models/line_configuration.dart';
import '../services/calculation_service.dart';
import '../services/database_service.dart';
import '../services/validation_service.dart';

class LineController {
  LineController({
    required this.lineName,
    required this.validationService,
    required this.calculationService,
    required this.databaseService,
  });

  final String lineName;

  final ValidationService validationService;
  final CalculationService calculationService;
  final DatabaseService databaseService;

  Future<ProcessLyeResult> processLyeTitration({
    required double pValue,
    required double mValue,
    required String substanceName,
    required LineConfiguration lineConfig,
  }) async {
    if (!validationService.isValidPValue(pValue)) {
      return ProcessLyeResult.failed(
        reason: 'Invalid p-value: must be between 0 and 25',
      );
    }

    if (!validationService.isValidMValue(mValue, pValue)) {
      return ProcessLyeResult.failed(
        reason: 'Invalid m-value: must be greater than p-value and <= 25',
      );
    }

    final LyeCalculationResult calculationResult = calculationService
        .calculateLye(pValue: pValue, mValue: mValue);

    if (!validationService.isValidConcentration(
      calculationResult.concentration,
      substanceName,
      lineConfig,
    )) {
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

    if (!validationService.isValidSoda(
      calculationResult.soda,
      calculationResult.concentration,
    )) {
      return ProcessLyeResult.failed(
        reason: 'Soda value is not less than concentration',
      );
    }

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

  Future<ProcessAcidResult> processAcidTitration({
    required double mValue,
    required String substanceName, // z.B. 'Acid'
    required LineConfiguration lineConfig,
  }) async {
    if (!validationService.isValueInInputRange(mValue)) {
      return ProcessAcidResult.failed(
        reason: 'Invalid m-value: must be between 0 and 25',
      );
    }

    final double concentration = calculationService.calculateAcid(
      mValue: mValue,
    );

    if (!validationService.isValidConcentration(
      concentration,
      substanceName,
      lineConfig,
    )) {
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

sealed class ProcessLyeResult {
  const ProcessLyeResult();

  factory ProcessLyeResult.success({
    required double concentration,
    required double soda,
  }) => _SuccessLye(concentration: concentration, soda: soda);

  factory ProcessLyeResult.outOfTolerance({
    required double concentration,
    required double soda,
    required ToleranceStatus status,
  }) => _OutOfToleranceLye(
    concentration: concentration,
    soda: soda,
    status: status,
  );

  factory ProcessLyeResult.failed({required String reason}) =>
      _FailedLye(reason: reason);
}

final class _SuccessLye extends ProcessLyeResult {
  const _SuccessLye({required this.concentration, required this.soda});
  final double concentration;
  final double soda;
}

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

final class _FailedLye extends ProcessLyeResult {
  const _FailedLye({required this.reason});
  final String reason;
}

sealed class ProcessAcidResult {
  const ProcessAcidResult();

  factory ProcessAcidResult.success({required double concentration}) =>
      _SuccessAcid(concentration: concentration);

  factory ProcessAcidResult.outOfTolerance({
    required double concentration,
    required ToleranceStatus status,
  }) => _OutOfToleranceAcid(concentration: concentration, status: status);

  factory ProcessAcidResult.failed({required String reason}) =>
      _FailedAcid(reason: reason);
}

final class _SuccessAcid extends ProcessAcidResult {
  const _SuccessAcid({required this.concentration});
  final double concentration;
}

final class _OutOfToleranceAcid extends ProcessAcidResult {
  const _OutOfToleranceAcid({
    required this.concentration,
    required this.status,
  });
  final double concentration;
  final ToleranceStatus status;
}

final class _FailedAcid extends ProcessAcidResult {
  const _FailedAcid({required this.reason});
  final String reason;
}
