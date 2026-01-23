// lib/features/authentication/logic/signup_view_model.dart
import 'package:flutter/material.dart';
import 'auth_repository.dart';

enum SignUpStatus { idle, loading, success, accountExists, failure }

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository _authRepo = AuthRepository();

  // 1. Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // 2. State
  SignUpStatus _status = SignUpStatus.idle;
  SignUpStatus get status => _status;

  String? _emailError;
  String? get emailErrorText => _emailError;

  String? _passwordError;
  String? get passwordErrorText => _passwordError;

  // 3. Logic
  Future<void> signUp() async {
    _status = SignUpStatus.loading;
    _emailError = null;
    _passwordError = null;
    notifyListeners();

    try {
      await _authRepo.signUp(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      _status = SignUpStatus.success;
      notifyListeners();
    } catch (e) {
      String error = e.toString();

      // Check specifically for "Account Exists" to trigger the dialog
      if (error.contains('email-already-in-use') ||
          error.contains('already registered')) {
        _status = SignUpStatus.accountExists;
      }
      // Handle other specific errors
      else if (error.contains('weak-password')) {
        _passwordError = "Password is too weak";
        _status = SignUpStatus.failure;
      } else {
        _emailError = "Sign up failed. Please try again.";
        _status = SignUpStatus.failure;
      }
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
