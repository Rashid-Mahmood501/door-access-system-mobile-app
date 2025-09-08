import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Door Access Mobile App',
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
