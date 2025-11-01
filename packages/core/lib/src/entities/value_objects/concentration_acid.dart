import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/calculation_service.dart';

class ConcentrationAcid extends ValueObject<double> {
  const ConcentrationAcid._(this._concentrationAcid);

  final double _concentrationAcid;

  @override
  ValueResult<double> get result => Value<double>(_concentrationAcid);

  /// Factory for creating a validated and calculated ConcentrationAcid value object.
  static ValueResult<ConcentrationAcid> create({
    required double pValue,
    required double mValue,
  }) {
    final double result = CalculationService.calculateConcentrationAcid(
      mValue: mValue,
    );
    return Value<ConcentrationAcid>(ConcentrationAcid._(result));
  }

  double get concentrationAcid => _concentrationAcid;

  @override
  String toString() => 'ConcentrationAcid($_concentrationAcid)';
}
