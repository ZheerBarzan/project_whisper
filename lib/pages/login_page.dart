import 'package:flutter/material.dart';
import 'package:project_whisper/services/auth/auth_service.dart';
import 'package:project_whisper/components/my_button.dart';
import 'package:project_whisper/components/my_square.dart';
import 'package:project_whisper/components/my_textfiled.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Function()? onTap;

  LoginPage({super.key, this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('چپە چپ'),
      ),*/
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            Image.asset('lib/images/mm.gif', height: 100),

            const SizedBox(
              height: 50,
            ),
            //welcome back
            Text(
              "!!!دیمانە و بە خێر",
              style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(
              height: 50,
            ),
            //email Textfiled
            MyTextField(
              hintText: "Username or Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(
              height: 10,
            ),
            //password Textfiled
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            // login button
            MyButton(onTap: () => login(context), text: "Login"),
            const SizedBox(
              height: 10,
            ),
            //rigister now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Register now",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // apple and google sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SqureTile(
                  imagePath: "lib/images/google.png",
                  onTap: () => AuthService().signInWithGoogle(),
                ),
                const SizedBox(width: 20),
                const SqureTile(
                  imagePath: "lib/images/apple.png",
                  onTap: null,
                ),
                const SizedBox(width: 20),
                const SqureTile(
                  imagePath: "lib/images/ms.png",
                  onTap: null,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
