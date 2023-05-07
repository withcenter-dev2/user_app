import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/create/addavatar.screen.dart';
import 'package:user_app/create/createprofile.screen.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/create', builder: (context, state) => const CreateProfileScreen()),
    GoRoute(path: '/add-avatar', builder: (context, state) => const AddAvatarScreen()),
  ]
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  build(context)
  {
    return MaterialApp.router(
      title: 'User App',
      routerConfig: _router,
    );
  }
}

class LoginScreen extends StatefulWidget
{
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
            const Icon(Icons.message),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              )
            ),
            const Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 15,
              )
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(children: const [
                TextField(),
                SizedBox(height: 20,),
                TextField()
              ]),
            ),
            const SizedBox(height: 50.0,),
            Column(
              children: [
                ElevatedButton(
                  onPressed: ()=>{}, 
                  child: const Text('LOGIN')
                ),
                const SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: ()=>context.go('/create'), 
                  child: const Text('Create an account')
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Text(
              'Forgot password? Recover here.'
            )
          ],
        ),
      ),
    );
  }
}