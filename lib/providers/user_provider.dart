import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _username;

  bool get isLoggedIn => _username != null;
  String get username => _username ?? '';

  void login(String username) {
    _username = username;
    notifyListeners();
  }

  void logout() {
    _username = null;
    notifyListeners();
  }
}
