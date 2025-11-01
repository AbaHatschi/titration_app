import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/calculation_service.dart';

class SodaLyeOne extends ValueObject<double> {
  const SodaLyeOne._(this._sodaLyeOne);

  final double _sodaLyeOne;

  @override
  ValueResult<double> get result => Value<double>(_sodaLyeOne);

  /// Factory for creating a validated and calculated SodaLyeOne value object.
  static ValueResult<SodaLyeOne> create({
    required double pValue,
    required double mValue,
  }) {
    final double result = CalculationService.calculateSodaLye(
      pValue: pValue,
      mValue: mValue,
    );
    return Value<SodaLyeOne>(SodaLyeOne._(result));
  }

  double get sodaLyeOne => _sodaLyeOne;

  @override
  String toString() => 'SodaLyeOne($_sodaLyeOne)';
}
