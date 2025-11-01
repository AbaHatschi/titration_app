/// Base sealed class for value results.
/// Represents either a valid value or a validation failure.
sealed class ValueResult<T> {}

/// Represents a valid value after successful validation.
class Value<T> extends ValueResult<T> {
  /// The actual validated value.
  Value(this.innerValue);

  final T innerValue;
}

/// Base sealed class for failed value results.
/// Contains a failure message describing the validation error.
sealed class FailedValue<T> extends ValueResult<T> {
  FailedValue({required this.failureMessage});

  final String failureMessage;
}

/// Specific failure type for validation errors.
class ValidationFailure<T> extends FailedValue<T> {
  ValidationFailure({required super.failureMessage});
}
