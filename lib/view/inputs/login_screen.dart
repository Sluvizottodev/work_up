import 'package:flutter/material.dart';
import '../../controller/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/space.dart';
import '../../utils/typography.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        title: Text(
          'Entrar',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.medium60),
            Text(
              'Bem-vindo de volta.',
              style: AppTypography.displayLarge.copyWith(
                color: AppColors.Black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(height: AppSpacing.medium40),
            TextField(
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
            ),
            SizedBox(height: AppSpacing.regular16),
            TextField(
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
            ),
            SizedBox(height: AppSpacing.medium40),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authController.login(
                    context,
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                } catch (e) {
                  print("Erro ao fazer login: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro ao fazer login: $e')),
                  );
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
                  'Entrar',
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
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text(
                  'Criar uma conta',
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
    );
  }
}
