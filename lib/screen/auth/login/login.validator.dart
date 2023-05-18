import 'package:flutter/material.dart';

String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) return 'Please enter the username';

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) return 'Please enter the password';
  // if (value.toString().length < 8) return 'Password too short';
  // if (value.toString().length > 20) return 'Password too long';

  return null;
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
