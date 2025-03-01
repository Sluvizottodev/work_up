import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:work_up/provider/organization_provider.dart';
import 'package:work_up/repository/organization_repo.dart';
import 'package:work_up/service/organization_service.dart';
import 'package:work_up/utils/routes.dart';
import 'provider/employee_provider.dart';
import 'provider/user_provider.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

  final organizationService = OrganizationService(OrganizationRepository());

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => EmployeeProvider()..loadEmployees()),
          ChangeNotifierProvider(create: (_) => OrganizationProvider(organizationService)),
          ChangeNotifierProvider(create: (_) => UserProvider()..loadUser()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkUp',
      theme: appTheme,
      initialRoute: AppRouter.loginRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}