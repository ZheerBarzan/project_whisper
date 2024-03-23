import 'package:flutter/material.dart';
import 'package:project_whisper/pages/login_page.dart';
import 'package:project_whisper/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'چپە چپ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: lightMode.colorScheme, useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
