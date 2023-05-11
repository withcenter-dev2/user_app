import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/login/login.screen.dart';
import 'package:user_app/create/addavatar.screen.dart';
import 'package:user_app/create/create.screen.dart';
import 'package:user_app/create/createprofile.screen.dart';
import 'package:user_app/home/home.screen.dart';
import 'package:firebase_core/firebase_core.dart'; //For connecting to our firebase app
import 'package:user_app/firebase_options.dart'; //Firebase configuration for selected platform

final GoRouter _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
  GoRoute(
      path: '/create-profile',
      builder: (context, state) => const CreateProfileScreen()),
  GoRoute(
      path: '/add-avatar',
      builder: (context, state) => const AddAvatarScreen()),
  GoRoute(
      path: '/create-user', builder: (context, state) => const SignUpScreen()),
  GoRoute(path: '/home', builder: (context, state) => const HomeScreen())
]);

// Flutterfire default initialization
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

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
