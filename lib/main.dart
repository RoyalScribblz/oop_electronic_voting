import 'package:flutter/material.dart';
import 'presentation/pages/auth_zero_page/auth_zero_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronic Voting',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const AuthZeroPage(),
    );
  }
}