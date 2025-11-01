import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';
import '../services/validation_service.dart';

class MValueAcid extends ValueObject<String> {
  const MValueAcid._(this._mValueAcid);

  final String _mValueAcid;

  @override
  ValueResult<String> get result => Value<String>(_mValueAcid);

  /// Factory for creating a validated MValueAcid value object.
  static ValueResult<MValueAcid> create(String input) {
    final String? error = ValidationService.validateInputValue(input: input);
    if (error != null) {
      return ValidationFailure<MValueAcid>(failureMessage: error);
    }
    return Value<MValueAcid>(MValueAcid._(input));
  }

  String get mValueAcid => _mValueAcid;

  @override
  String toString() => 'MValueAcid($_mValueAcid)';
}
