class ValidationService {
  static String? validateInputValue({
    required String input,
    bool allowSpaces = false,
    int minLength = 1,
  }) {
    if (input.isEmpty) {
      return 'Value cannot be empty.';
    }
    if (double.tryParse(input) == null) {
      return 'Value must be a valid number.';
    }
    if (!allowSpaces && input.contains(' ')) {
      return 'Value must not contain spaces.';
    }
    if (input.length < minLength) {
      return 'Value must be at least $minLength characters long.';
    }
    if (double.tryParse(input)! < 0 || double.tryParse(input)! > 25) {
      return 'Value must be between 0 and 25.';
    }
    return null;
  }
}
