import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/create/addavatar.screen.dart';
import 'package:user_app/create/createprofile.screen.dart';

final GoRouter _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
  GoRoute(
      path: '/create',
      builder: (context, state) => const CreateProfileScreen()),
  GoRoute(
      path: '/add-avatar',
      builder: (context, state) => const AddAvatarScreen()),
]);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(context) {
    return MaterialApp.router(
      title: 'User App',
      routerConfig: _router,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const Text('Welcome',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const Text('Sign in to continue',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(children: const [
                TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.check),
                      suffixIconColor: Colors.orange,
                      hintText: 'xxxx_xx@xxx.com'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: Colors.black38,
                      hintText: '******'),
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
                    onPressed: () => {print('Authenticate credentials')},
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
                    onPressed: () => {context.go('/create')},
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
                      text: 'here',
                      style: const TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => {print('Go to password recovery page.')}),
                ]))
          ],
        ),
      ),
    );
  }
}
