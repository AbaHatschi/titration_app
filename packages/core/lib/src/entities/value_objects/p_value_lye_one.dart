import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/validation_service.dart';

class PValueLyeOne extends ValueObject<String> {
  const PValueLyeOne._(this._pValueLyeOne);

  final String _pValueLyeOne;

  @override
  ValueResult<String> get result => Value<String>(_pValueLyeOne);

  /// Factory for creating a validated PValueLyeOne value object.
  static ValueResult<PValueLyeOne> create(String input) {
    final String? error = ValidationService.validateInputValue(input: input);
    if (error != null) {
      return ValidationFailure<PValueLyeOne>(failureMessage: error);
    }
    return Value<PValueLyeOne>(PValueLyeOne._(input));
  }

  String get pValueLyeOne => _pValueLyeOne;

  @override
  String toString() => 'PValueLyeOne($_pValueLyeOne)';
}
