import '../../utils/value_objects/value_object.dart';
import '../../utils/value_objects/value_result.dart';

class Timestamp extends ValueObject<DateTime> {
  const Timestamp._(this._timestamp);

  final DateTime _timestamp;

  @override
  ValueResult<DateTime> get result => Value<DateTime>(_timestamp);

  /// Factory for creating a validated Timestamp value object.
  /// Factory for creating a Timestamp value object (always current date).
  static ValueResult<Timestamp> create() {
    return Value<Timestamp>(Timestamp._(DateTime.now()));
  }

  DateTime get timestamp => _timestamp;

  @override
  String toString() => 'Timestamp($_timestamp)';
}
