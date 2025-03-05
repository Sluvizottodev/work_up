import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/organization_provider.dart';
import '../../utils/colors.dart';
import '../../utils/space.dart';
import '../../utils/typography.dart';

class OrganizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orgProvider = Provider.of<OrganizationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Organizações',
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
        padding: EdgeInsets.all(AppSpacing.regular20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _showCreateOrganizationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.BluePrimary,
                padding: EdgeInsets.symmetric(vertical: AppSpacing.regular16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.medium32),
                ),
                elevation: 0,
              ),
              child: Text(
                'Criar Organização',
                style: AppTypography.displayMedium.copyWith(
                  color: AppColors.White,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: AppSpacing.regular16),
            ElevatedButton(
              onPressed: () {
                _showJoinOrganizationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.Gray10,
                padding: EdgeInsets.symmetric(vertical: AppSpacing.regular16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.medium32),
                ),
                elevation: 0,
              ),
              child: Text(
                'Entrar em uma Organização',
                style: AppTypography.displayMedium.copyWith(
                  color: AppColors.Black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateOrganizationDialog(BuildContext context) {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    final passwordController = TextEditingController();
    final userId = "user123";

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Criar Organização',
          style: AppTypography.displayLarge.copyWith(
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(nameController, 'Nome da organização'),
            SizedBox(height: AppSpacing.regular16),
            _buildTextField(codeController, 'Código da organização'),
            SizedBox(height: AppSpacing.regular16),
            _buildTextField(passwordController, 'Senha', obscure: true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'Cancelar',
              style: AppTypography.displaySmall.copyWith(
                color: AppColors.BluePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<OrganizationProvider>(context, listen: false)
                  .createOrganization(nameController.text, codeController.text, passwordController.text, userId);
              Navigator.of(ctx).pop();
            },
            child: Text(
              'Criar',
              style: AppTypography.displaySmall.copyWith(
                color: AppColors.BluePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.displaySmall.copyWith(color: AppColors.Gray20),
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
    );
  }

  void _showJoinOrganizationDialog(BuildContext context) {
    final orgCodeController = TextEditingController();
    final passwordController = TextEditingController();
    final userId = "user123";
    final role = "member";

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Entrar em uma Organização',
          style: AppTypography.displayLarge.copyWith(
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(orgCodeController, 'Código da organização'),
            SizedBox(height: AppSpacing.regular16),
            _buildTextField(passwordController, 'Senha', obscure: true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'Cancelar',
              style: AppTypography.displaySmall.copyWith(
                color: AppColors.BluePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<OrganizationProvider>(context, listen: false)
                  .joinOrganization(orgCodeController.text, passwordController.text, userId, role);
              Navigator.of(ctx).pop();
            },
            child: Text(
              'Entrar',
              style: AppTypography.displaySmall.copyWith(
                color: AppColors.BluePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
