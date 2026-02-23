// lib/core/utils/validators.dart

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required!';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address!';
    }
    return null;
  }

  static String? validatePasswordWhenSignIn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required!';
    }

    return null;
  }

  static String? validatePasswordWhenSignUp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required!';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long!';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm password!';
    }
    if (password != value) {
      return 'Passwords do not match!';
    }
    return null;
  }

  static String? getResetError(String error) {
    final err = error.toLowerCase();
    if (err.contains('user-not-found') || err.contains('no user found')) {
      return 'This email is not registered.';
    }
    return null;
  }
}
