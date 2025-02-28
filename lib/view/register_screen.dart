import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import '../utils/colors.dart';
import '../utils/space.dart';
import '../utils/typography.dart';
import '../utils/validator/email_validator.dart';
import '../utils/validator/password_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final AuthService _authService = AuthService(); // Instância do AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        title: Text(
          'Criar conta',
          style: AppTypography.displayLarge.copyWith(
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.White,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.regular20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.medium60),
              Text(
                'Crie sua conta.',
                style: AppTypography.displayLarge.copyWith(
                  color: AppColors.Black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: AppSpacing.medium40),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  hintStyle: AppTypography.displaySmall.copyWith(
                    color: AppColors.Gray20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.Gray10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.BluePrimary),
                  ),
                  filled: true,
                  fillColor: AppColors.Gray00,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome.';
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSpacing.regular16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: AppTypography.displaySmall.copyWith(
                    color: AppColors.Gray20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.Gray10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.BluePrimary),
                  ),
                  filled: true,
                  fillColor: AppColors.Gray00,
                ),
                validator: EmailValidator.validate,
              ),
              SizedBox(height: AppSpacing.regular16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: AppTypography.displaySmall.copyWith(
                    color: AppColors.Gray20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.Gray10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.BluePrimary),
                  ),
                  filled: true,
                  fillColor: AppColors.Gray00,
                ),
                validator: PasswordValidator.validate,
              ),
              SizedBox(height: AppSpacing.regular16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirmar Senha',
                  hintStyle: AppTypography.displaySmall.copyWith(
                    color: AppColors.Gray20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.Gray10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    borderSide: BorderSide(color: AppColors.BluePrimary),
                  ),
                  filled: true,
                  fillColor: AppColors.Gray00,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha.';
                  }
                  if (value != _passwordController.text) {
                    return 'As senhas não coincidem.';
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSpacing.medium40),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _registerUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.BluePrimary,
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.regular16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.medium32),
                  ),
                  elevation: 0,
                ),
                child: Center(
                  child: Text(
                    'Registrar',
                    style: AppTypography.displayMedium.copyWith(
                      color: AppColors.White,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.regular16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Já tem uma conta? Faça login',
                    style: AppTypography.displaySmall.copyWith(
                      color: AppColors.BluePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      User? user = await _authService.register(email, password);
      if (user != null) {
        // Aqui você pode salvar o nome do usuário no Firestore ou Realtime Database
        print('Usuário registrado com sucesso: ${user.uid}');
        Navigator.of(context).pop(); // Volta para a tela de login
      }
    } catch (e) {
      print('Erro ao registrar: $e');
    }
  }
}