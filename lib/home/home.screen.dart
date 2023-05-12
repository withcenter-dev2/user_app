import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/widgets/user.ready.dart';
import 'package:firebase_auth/firebase_auth.dart'; //For user authentication

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  createState() => HomeScreenState();
}

class HomeScreenState extends State {
  @override
  build(context) {
    return Scaffold(
        body: SafeArea(
      child: UserReady(
          builder: (user) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (user != null) ...[
                      Text(user.toString()),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          if (mounted) {
                            context.go('/');
                          }
                        },
                        child: const Text('Sign Out'),
                      )
                    ],
                    if (user == null) ...[
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          children: [
                            const TextSpan(text: 'Please login first '),
                            TextSpan(
                                text: 'here.',
                                style: const TextStyle(color: Colors.red),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {context.go('/')})
                          ],
                        ),
                      )
                    ]
                  ],
                ),
              )),
    ));
  }
}
