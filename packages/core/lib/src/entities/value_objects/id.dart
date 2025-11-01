import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';

class Id extends ValueObject<String> {
  const Id._(this._id);

  final String _id;

  @override
  ValueResult<String> get result => Value<String>(_id);

  /// Factory for creating an Id value object.
  static ValueResult<Id> create(String input) {
    if (input.isEmpty) {
      return ValidationFailure<Id>(failureMessage: 'ID cannot be empty.');
    }
    return Value<Id>(Id._(input));
  }

  String get id => _id;

  @override
  String toString() => 'Id($_id)';
}
