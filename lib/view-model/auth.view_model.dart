import 'package:firebase_auth/firebase_auth.dart'; //For user authentication
import 'dart:developer';

class AuthViewModel {
  final String email;
  final String password;
  final Function goToHome;
  final Function setEmailError;
  final Function setPasswordError;

  String emailErr = '';
  String passwordErr = '';

  AuthViewModel(
      {required this.email,
      required this.password,
      required this.goToHome,
      required this.setEmailError,
      required this.setPasswordError});

  login() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(credential.user.toString());
      goToHome();
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
      setEmailError(emailErr);
      setPasswordError(passwordErr);
    } catch (e) {
      log(e.toString());
    }
  }

  register() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // ignore: avoid_print
      log(credential.user.toString());
      goToHome();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emailErr = 'Email already exist.';
      } else if (e.code == 'invalid-email') {
        emailErr = 'The email you provide is invalid.';
      } else if (e.code == 'weak-password') {
        passwordErr = 'The password is weak.';
      } else if (e.code == 'operation-not-allowed') {
        emailErr = 'The user/password is not enabled.';
      } else {
        log(e.code);
        log(e.message.toString());
      }
      setEmailError(emailErr);
      setPasswordError(passwordErr);
    } catch (e) {
      log(e.toString());
    }
  }
}
