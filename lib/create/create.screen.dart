import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart'; //For user authentication

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
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email.text, password: password.text);
                        // ignore: avoid_print
                        print(credential.user);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          setState(() {
                            emailErr = 'Email already exist.';
                          });
                        } else if (e.code == 'invalid-email') {
                          setState(() {
                            emailErr = 'The email you provide is invalid.';
                          });
                        } else if (e.code == 'weak-password') {
                          setState(() {
                            passwordErr = 'The password is weak.';
                          });
                        } else if (e.code == 'operation-not-allowed') {
                          setState(() {
                            emailErr = 'The user/password is not enabled.';
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
