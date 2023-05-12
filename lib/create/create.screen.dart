import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/view-model/auth.view_model.dart'; //For user authentication

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  String emailErr = '';
  String passwordErr = '';

  late AuthViewModel auth =
      AuthViewModel(email: email.text, password: password.text);

  @override
  build(_) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Center(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/images/profile_avatar.png'),
              ),
            ),
            const SizedBox(height: 50.0),
            const Text('Create an account',
                style: TextStyle(fontSize: 15, color: Colors.black54)),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(children: [
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.check),
                      suffixIconColor: Colors.orange,
                      hintText: 'xxxx_xx@xxx.com'),
                ),
                Text(
                  emailErr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: Colors.black38,
                      hintText: '******'),
                ),
                Text(
                  passwordErr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ]),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 220.0,
                  child: ElevatedButton(
                    // ignore: avoid_print
                    onPressed: () {
                      auth = AuthViewModel(
                          email: email.text, password: password.text);
                      auth.register();
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15.0))),
                    child: const Text('SIGN UP'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                    children: [
                  const TextSpan(text: 'Already have an account? Login '),
                  TextSpan(
                      text: 'here.',
                      style: const TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            // ignore: avoid_print
                            () => {context.go('/')}),
                ]))
          ],
        ),
      ),
    );
  }
}
