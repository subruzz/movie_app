/// A utility class that provides static methods for validating user input.
///
/// This class contains methods to validate various fields such as name,
/// email, password, and phone number. Each validation method returns an
/// error message if the input is invalid; otherwise, it returns null.
class Validator {
  /// Validates the provided [value] for the name field.
  ///
  /// Returns an error message if the name is null or empty,
  /// otherwise returns null.
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null; 
  }

  /// Validates the provided [value] for the email field.
  ///
  /// Returns an error message if the email is null or empty,
  /// or if it does not match a valid email pattern.
  /// Otherwise, returns null.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    const emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; 
  }

  /// Validates the provided [value] for the password field.
  ///
  /// Returns an error message if the password is null or empty,
  /// or if it is shorter than 6 characters. Otherwise, returns null.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; 
  }

  /// Validates the provided [value] for the phone number field.
  ///
  /// Returns an error message if the phone number is null or empty,
  /// or if it does not match the expected 10-digit format.
  /// Otherwise, returns null.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    const phonePattern = r'^\d{10}$';
    final regExp = RegExp(phonePattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null; 
  }
}
