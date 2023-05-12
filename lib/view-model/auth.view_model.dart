import 'package:firebase_auth/firebase_auth.dart'; //For user authentication
import 'dart:developer';

class AuthViewModel {
  final String email;
  final String password;

  String emailErr = '';
  String passwordErr = '';

  AuthViewModel({required this.email, required this.password});

  login() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(credential.user.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emailErr = 'No user found for this email.';
      } else if (e.code == 'invalid-email') {
        emailErr = 'The email you provide is invalid.';
      } else if (e.code == 'wrong-password') {
        passwordErr = 'Wrong password';
      } else if (e.code == 'user-disabled') {
        emailErr = 'User account is disabled';
      } else {
        log(e.code);
        log(e.message.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
