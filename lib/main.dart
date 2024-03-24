import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_whisper/auth/auth_gate.dart';
import 'package:project_whisper/firebase_options.dart';
import 'package:project_whisper/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'چپە چپ',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(colorScheme: lightMode.colorScheme, useMaterial3: true),
        home: const AuthGate());
  }
}
