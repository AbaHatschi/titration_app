import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/validation_service.dart';

class MValueLyeOne extends ValueObject<String> {
  const MValueLyeOne._(this._mValueLyeOne);

  final String _mValueLyeOne;

  @override
  ValueResult<String> get result => Value<String>(_mValueLyeOne);

  /// Factory for creating a validated MValueLyeOne value object.
  static ValueResult<MValueLyeOne> create(String input) {
    final String? error = ValidationService.validateInputValue(input: input);
    if (error != null) {
      return ValidationFailure<MValueLyeOne>(failureMessage: error);
    }
    return Value<MValueLyeOne>(MValueLyeOne._(input));
  }

  String get mValueLyeOne => _mValueLyeOne;

  @override
  String toString() => 'MValueLyeOne($_mValueLyeOne)';
}
