import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart'; //For user authentication

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  String emailErr = '';
  String passwordErr = '';

  @override
  build(_) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.message_outlined,
              size: 50,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text('Welcome',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const Text('Sign in to continue',
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
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text);
                        log(credential.user.toString());
                        if (mounted) {
                          context.go('/home');
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          setState(() {
                            emailErr = 'No user found for this email.';
                          });
                        } else if (e.code == 'invalid-email') {
                          setState(() {
                            emailErr = 'The email you provide is invalid.';
                          });
                        } else if (e.code == 'wrong-password') {
                          setState(() {
                            passwordErr =
                                'Wrong password provided for that email.';
                          });
                        } else if (e.code == 'user-disabled') {
                          setState(() {
                            emailErr = 'The user account is disabled.';
                          });
                        } else {
                          log(e.code);
                          log(e.message.toString());
                        }
                      } catch (e) {
                        log(e.toString());
                      }
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15.0))),
                    child: const Text('LOGIN'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 220.0,
                  child: ElevatedButton(
                    onPressed: () => {
                      //context.go('/create-profile');
                      context.go('/create-user')
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade400),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15.0))),
                    child: const Text('Create an account.'),
                  ),
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
                  const TextSpan(text: 'Forgot password? Recover '),
                  TextSpan(
                      text: 'here.',
                      style: const TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            // ignore: avoid_print
                            () => {print('Go to password recovery page.')}),
                ]))
          ],
        ),
      ),
    );
  }
}
