import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_up/view/home_screen.dart';

import 'provider/employee_provider.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()..loadEmployees()),
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
      title: 'Be Talent',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}

