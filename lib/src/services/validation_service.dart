import '../models/line_configuration.dart';

class ValidationService {
  static const double inputMinValue = 0.0;
  static const double inputMaxValue = 25.0;

  bool isValueInInputRange(double value) {
    return value >= inputMinValue && value <= inputMaxValue;
  }

  bool isValidPValue(double pValue) {
    return pValue >= inputMinValue && pValue <= inputMaxValue;
  }

  bool isValidMValue(double mValue, double pValue) {
    if (mValue <= pValue) {
      return false;
    }

    return mValue >= inputMinValue && mValue <= inputMaxValue;
  }

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

  bool isValidSoda(double soda, double concentration) {
    return soda < concentration;
  }

  ToleranceStatus getToleranceStatus(
    double value,
    String substanceName,
    LineConfiguration lineConfig,
  ) {
    final double? minTolerance = lineConfig.getToleranceMin(substanceName);
    final double? maxTolerance = lineConfig.getToleranceMax(substanceName);

    if (minTolerance == null || maxTolerance == null) {
      return ToleranceStatus.invalid;
    }

    if (value < minTolerance) {
      return ToleranceStatus.belowTolerance;
    } else if (value > maxTolerance) {
      return ToleranceStatus.aboveTolerance;
    } else {
      return ToleranceStatus.withinTolerance;
    }
  }
}

enum ToleranceStatus {
  belowTolerance,
  withinTolerance,
  aboveTolerance,
  invalid,
}
