import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/calculation_service.dart';

class ConcentrationLyeOne extends ValueObject<double> {
  const ConcentrationLyeOne._(this._concentrationLyeOne);

  final double _concentrationLyeOne;

  @override
  ValueResult<double> get result => Value<double>(_concentrationLyeOne);

  /// Factory for creating a validated and calculated ConcentrationLyeOne value object.
  static ValueResult<ConcentrationLyeOne> create({
    required double pValue,
    required double mValue,
  }) {
    final double result = CalculationService.calculateConcentrationLye(
      pValue: pValue,
      mValue: mValue,
    );
    return Value<ConcentrationLyeOne>(ConcentrationLyeOne._(result));
  }

  double get concentrationLyeOne => _concentrationLyeOne;

  @override
  String toString() => 'ConcentrationLyeOne($_concentrationLyeOne)';
}
