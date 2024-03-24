import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_whisper/auth/login_or_register.dart';
import 'package:project_whisper/pages/homepage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            //user not logged in
            return const LoginOrRegistrationPage();
          }
        },
      ),
    );
  }
}
