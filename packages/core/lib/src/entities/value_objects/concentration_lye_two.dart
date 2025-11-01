import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/calculation_service.dart';

class ConcentrationLyeTwo extends ValueObject<double> {
  const ConcentrationLyeTwo._(this._concentrationLyeTwo);

  final double _concentrationLyeTwo;

  @override
  ValueResult<double> get result => Value<double>(_concentrationLyeTwo);

  /// Factory for creating a validated and calculated ConcentrationLyeTwo value object.
  static ValueResult<ConcentrationLyeTwo> create({
    required double pValue,
    required double mValue,
  }) {
    final double result = CalculationService.calculateConcentrationLye(
      pValue: pValue,
      mValue: mValue,
    );
    return Value<ConcentrationLyeTwo>(ConcentrationLyeTwo._(result));
  }

  double get concentrationLyeTwo => _concentrationLyeTwo;

  @override
  String toString() => 'ConcentrationLyeTwo($_concentrationLyeTwo)';
}
