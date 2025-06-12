import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String _userId = '';
  String _username = '';

  bool get isAuthenticated => _isAuthenticated;
  String get userId => _userId;
  String get username => _username;

  Future<bool> login(String username, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    if (username.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _userId = 'user_123';
      _username = username;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isAuthenticated = false;
    _userId = '';
    _username = '';
    notifyListeners();
  }

  Future<void> updateProfile({String? newUsername}) async {
    if (newUsername != null && newUsername.isNotEmpty) {
      _username = newUsername;
      notifyListeners();
    }
  }
}
