import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/calculation_service.dart';

class SodaLyeTwo extends ValueObject<double> {
  const SodaLyeTwo._(this._sodaLyeTwo);

  final double _sodaLyeTwo;

  @override
  ValueResult<double> get result => Value<double>(_sodaLyeTwo);

  /// Factory for creating a validated and calculated SodaLyeTwo value object.
  static ValueResult<SodaLyeTwo> create({
    required double pValue,
    required double mValue,
  }) {
    final double result = CalculationService.calculateSodaLye(
      pValue: pValue,
      mValue: mValue,
    );
    return Value<SodaLyeTwo>(SodaLyeTwo._(result));
  }

  double get sodaLyeTwo => _sodaLyeTwo;

  @override
  String toString() => 'SodaLyeTwo($_sodaLyeTwo)';
}
