class FormatterService {
  /// Formats a string so that it is represented as a double with a maximum of one decimal place.
  /// Examples:
  ///   ".6" => "0.6"
  ///   "10" => "10.0"
  ///   "10.123" => "10.1"
  static String formatInputValue({required String input}) {
    // Empty input remains empty
    if (input.trim().isEmpty) {
      return '';
    }

    // Replace comma with dot
    String normalized = input.replaceAll(',', '.');

    // If the string starts with a dot (e.g. ".6"), prepend a 0
    if (normalized.startsWith('.')) {
      normalized = '0$normalized';
    }

    // Try to parse the value as a double
    double? value = double.tryParse(normalized);
    if (value == null) {
      return input; // Invalid input remains unchanged
    }

    // Round to one decimal place
    value = double.parse(value.toStringAsFixed(1));

    // Return as string
    return value.toString();
  }
}
