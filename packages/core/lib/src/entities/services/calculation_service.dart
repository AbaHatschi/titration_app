class CalculationService {
  /// Calculates the concentration of lye based on the provided values.
  static double calculateConcentrationLye({
    required double pValue,
    required double mValue,
  }) {
    // Calculation: (2*p-m)*0.16
    final double result = (2 * pValue - mValue) * 0.16;
    // Formatting to one decimal place
    return parseResult(result: result);
  }

  static double calculateSodaLye({
    required double pValue,
    required double mValue,
  }) {
    // Calculation: (2*p-m)*0.13
    final double result = (mValue - pValue) * 0.424;
    // Formatting to one decimal place
    return parseResult(result: result);
  }

  static double calculateConcentrationAcid({required double mValue}) {
    // Calculation: m*0.16
    final double result = mValue * 0.25;
    // Formatting to one decimal place
    return parseResult(result: result);
  }

  static double parseResult({required double result}) {
    return double.parse(result.toStringAsFixed(1));
  }
}
