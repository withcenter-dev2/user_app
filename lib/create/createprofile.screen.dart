import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateProfileScreen extends StatefulWidget{
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  build(context)
  {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Create an account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              color: Colors.white,
              width: 400,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: ()=> context.go('/'),
                      child: const Icon(Icons.close),
                    ),
                    Row(
                      children: const [
                        Text(
                          'First Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: const [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: const [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: const [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: const [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: const [
                        Text(
                          'Country',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: const [
                        Text(
                          'Birth date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 60.0),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (bool)=>{}),
                        const Text(
                          'Text here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (bool)=>{}),
                        const Text(
                          'Text here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: ()=>context.go('/add-avatar'), 
                      child: const Text('Next')
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}