import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<void> login(BuildContext context, String email, String password) async {
    User? user = await _authService.login(email, password);
    if (user != null) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha no login')),
      );
    }
  }

  Future<void> register(BuildContext context, String email, String password) async {
    User? user = await _authService.register(email, password);
    if (user != null) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha no registro')),
      );
    }
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}