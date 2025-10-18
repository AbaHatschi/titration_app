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

class LyeCalculationResult {
  LyeCalculationResult({required this.concentration, required this.soda});

  final double concentration;

  final double soda;

  @override
  String toString() =>
      'LyeCalculationResult(concentration: $concentration, soda: $soda)';
}
