import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/validation_service.dart';

class MValueLyeTwo extends ValueObject<String> {
  const MValueLyeTwo._(this._mValueLyeTwo);

  final String _mValueLyeTwo;

  @override
  ValueResult<String> get result => Value<String>(_mValueLyeTwo);

  /// Factory for creating a validated MValueLyeTwo value object.
  static ValueResult<MValueLyeTwo> create(String input) {
    final String? error = ValidationService.validateInputValue(input: input);
    if (error != null) {
      return ValidationFailure<MValueLyeTwo>(failureMessage: error);
    }
    return Value<MValueLyeTwo>(MValueLyeTwo._(input));
  }

  String get mValueLyeTwo => _mValueLyeTwo;

  @override
  String toString() => 'MValueLyeTwo($_mValueLyeTwo)';
}
