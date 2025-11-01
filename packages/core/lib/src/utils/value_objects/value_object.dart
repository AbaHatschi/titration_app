import 'package:flutter/foundation.dart';

import 'value_result.dart';

/// Base class for all value objects.
/// Implements immutability, equality, and validation pattern.
@immutable
abstract class ValueObject<T> {
  /// Constructor for value objects. Should be called by subclasses.
  const ValueObject();

  /// Returns the wrapped value result (either valid value or failure).
  ValueResult<T> get result;

  /// Equality operator override for value objects.
  /// Compares by value, not by reference.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ValueObject<T> && other.result == result;
  }

  /// Hash code override for value objects.
  @override
  int get hashCode => result.hashCode;

  /// Returns the value if valid, otherwise throws an exception.
  /// Use with care: prefer explicit error handling if possible.
  T getOrCrash() {
    switch (result) {
      case Value<T>(innerValue: final T innerValue):
        return innerValue;
      case FailedValue<T>(failureMessage: final String failureMessage):
        throw Exception('ValueObject is invalid: $failureMessage');
    }
  }

  /// Returns true if the value is valid, false otherwise.
  bool isValid() {
    switch (result) {
      case Value<T>():
        return true;
      case FailedValue<T>():
        return false;
    }
  }
}
