import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/validation_service.dart';

class PValueLyeTwo extends ValueObject<String> {
  const PValueLyeTwo._(this._pValueLyeTwo);

  final String _pValueLyeTwo;

  @override
  ValueResult<String> get result => Value<String>(_pValueLyeTwo);

  /// Factory for creating a validated PValueLyeTwo value object.
  static ValueResult<PValueLyeTwo> create(String input) {
    final String? error = ValidationService.validateInputValue(input: input);
    if (error != null) {
      return ValidationFailure<PValueLyeTwo>(failureMessage: error);
    }
    return Value<PValueLyeTwo>(PValueLyeTwo._(input));
  }

  String get pValueLyeTwo => _pValueLyeTwo;

  @override
  String toString() => 'PValueLyeTwo($_pValueLyeTwo)';
}
