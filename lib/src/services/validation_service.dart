import '../models/line_configuration.dart';

/// A service class for validating input values and concentration tolerances.
/// Provides methods to check if values are within acceptable ranges,
/// and to determine tolerance status for different substances.
/// Example usage:
/// ```dart
/// final validationService = ValidationService();
/// final isValid = validationService.isValidPValue(10.0);
/// ```
class ValidationService {
  static const double inputMinValue = 0.0;
  static const double inputMaxValue = 25.0;

  /// Checks if the given [value] is within the acceptable input range.
  ///
  /// Returns true if within range, false otherwise.
  bool isValueInInputRange(double value) {
    return value >= inputMinValue && value <= inputMaxValue;
  }

  /// Validates the provided pH value [pValue].
  ///
  /// Returns true if the pH value is within the acceptable range, false otherwise.
  bool isValidPValue(double pValue) {
    return pValue >= inputMinValue && pValue <= inputMaxValue;
  }

  /// Validates the provided mV value [mValue] against the given pH value [pValue].
  ///
  /// Returns true if the mV value is greater than the pH value and within the acceptable range, false otherwise.
  bool isValidMValue(double mValue, double pValue) {
    if (mValue <= pValue) {
      return false;
    }

    return mValue >= inputMinValue && mValue <= inputMaxValue;
  }

  /// Validates the provided concentration value [concentration] for a specific substance.
  /// 
  /// Returns true if the concentration is within the acceptable range, false otherwise.
  bool isValidConcentration(
    double concentration,
    String substanceName,
    LineConfiguration lineConfig,
  ) {
    final double? minTolerance = lineConfig.getToleranceMin(substanceName);
    final double? maxTolerance = lineConfig.getToleranceMax(substanceName);

    if (minTolerance == null || maxTolerance == null) {
      return false;
    }

    return concentration >= minTolerance && concentration <= maxTolerance;
  }

  /// Validates the provided soda value [soda] against the given concentration [concentration].
  /// 
  /// Returns true if the soda value is less than the concentration, false otherwise.
  bool isValidSoda(double soda, double concentration) {
    return soda < concentration;
  }

  /// Determines the tolerance status of a given [value] for a specific substance.
  /// Returns a [ToleranceStatus] indicating whether the value is below, within, or above tolerance.
  /// [substanceName] is the name of the substance (e.g., 'Lye1', 'Lye2', 'Acid').
  /// [lineConfig] provides the tolerance ranges for the specific production line.
  /// Parameters:
  /// - [value]: The value to be checked.
  /// - [substanceName]: The name of the substance.
  /// - [lineConfig]: The line configuration containing tolerance ranges.
  /// 
  /// Returns:
  /// - [ToleranceStatus.belowTolerance] if the value is below the minimum tolerance.
  /// - [ToleranceStatus.withinTolerance] if the value is within the tolerance range.
  /// - [ToleranceStatus.aboveTolerance] if the value is above the maximum tolerance.
  /// - [ToleranceStatus.invalid] if the tolerance range is not defined.
  /// 
  /// Example:
  /// ```dart
  /// final status = getToleranceStatus(10.0, 'Lye1', lineConfig);
  /// ``` 
  ToleranceStatus getToleranceStatus(
    double value,
    String substanceName,
    LineConfiguration lineConfig,
  ) {
    final double? minTolerance = lineConfig.getToleranceMin(substanceName);
    final double? maxTolerance = lineConfig.getToleranceMax(substanceName);

    // If tolerance range is not defined, return invalid status
    if (minTolerance == null || maxTolerance == null) {
      return ToleranceStatus.invalid;
    }

    // Determine tolerance status
    if (value < minTolerance) {
      return ToleranceStatus.belowTolerance;
    } else if (value > maxTolerance) {
      return ToleranceStatus.aboveTolerance;
    } else {
      return ToleranceStatus.withinTolerance;
    }
  }
}

/// An enumeration representing the tolerance status of a value.
/// - [belowTolerance]: The value is below the minimum tolerance.
/// - [withinTolerance]: The value is within the acceptable tolerance range.
/// - [aboveTolerance]: The value is above the maximum tolerance.
/// - [invalid]: The value is invalid (e.g., if no tolerance range is defined).
enum ToleranceStatus {
  belowTolerance,
  withinTolerance,
  aboveTolerance,
  invalid,
}
