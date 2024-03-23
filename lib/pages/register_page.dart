import 'package:flutter/material.dart';
import 'package:project_whisper/components/my_button.dart';
import 'package:project_whisper/components/my_square.dart';
import 'package:project_whisper/components/my_textfiled.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final Function()? onTap;
  RegisterPage({super.key, this.onTap});
  void signup() {}

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
            Icon(Icons.message,
                size: 100, color: Theme.of(context).colorScheme.inversePrimary),

            const SizedBox(
              height: 50,
            ),
            //welcome back

            Text(
              "!!!یاخوا وێڵکەم بی",
              style: TextStyle(
                  fontSize: 28, color: Theme.of(context).colorScheme.primary),
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
            //confirm password Textfiled
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(
              height: 10,
            ),
            // login button
            MyButton(onTap: signup, text: "Sign Up"),
            const SizedBox(
              height: 10,
            ),
            //rigister now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already a member?"),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Login now",
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
                  onTap: () {},
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
