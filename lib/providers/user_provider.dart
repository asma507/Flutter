import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _name;
  String? _email;

  // Check if user is logged in
  bool get isLoggedIn => _name != null && _email != null;

  // Getters
  String get name => _name ?? '';
  String get email => _email ?? '';

  // Login function
  void login(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }

  // Logout function
  void logout() {
    _name = null;
    _email = null;
    notifyListeners();
  }
}
