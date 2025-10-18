/// A service class for performing various calculations related to lye and acid concentrations.
/// Provides methods to calculate lye concentration and soda, as well as acid concentration.
/// The calculations are based on provided pH and mV values.
/// Example usage:
/// ```dart
/// final calculationService = CalculationService();
/// final lyeResult = calculationService.calculateLye(pValue: 10.0, mValue: 20.0);
/// print(lyeResult.concentration); // Outputs the calculated lye concentration
/// final acidConcentration = calculationService.calculateAcid(mValue: 15.0);
/// print(acidConcentration); // Outputs the calculated acid concentration
/// ```
class CalculationService {
  LyeCalculationResult calculateLye({
    required double pValue,
    required double mValue,
  }) {
    final double concentration = (2 * pValue - mValue) * 0.16;

    final double soda = (mValue - pValue) * 0.424;

    return LyeCalculationResult(concentration: concentration, soda: soda);
  }

  double calculateAcid({required double mValue}) {
    return mValue * 0.25;
  }
}

/// A model representing the result of a lye calculation,
/// including the concentration and soda values.
/// Example usage:
/// ```dart
/// final result = LyeCalculationResult(concentration: 2.5, soda: 1.2);
/// print(result.concentration); // Outputs: 2.5
/// ```
class LyeCalculationResult {
  LyeCalculationResult({required this.concentration, required this.soda});

  final double concentration;

  final double soda;

  @override
  String toString() =>
      'LyeCalculationResult(concentration: $concentration, soda: $soda)';
}
