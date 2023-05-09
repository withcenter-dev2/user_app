import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAvatarScreen extends StatelessWidget {
  const AddAvatarScreen({super.key});

  @override
  build(context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Create an account',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
              InkWell(
                onTap: () => {context.go('/create')},
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Text(
                      'back',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: Row(children: const [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2.0,
                    color: Colors.green,
                  )),
                  Icon(
                    Icons.radio_button_on,
                    color: Colors.green,
                  ),
                ]),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.white, spreadRadius: 3),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile picture',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 60,
                        ),
                        const Center(
                          child: CircleAvatar(
                            radius: 70.0,
                            backgroundImage:
                                AssetImage('assets/images/profile_avatar.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Column(children: [
                            Text(
                              'Upload a photo',
                              style: TextStyle(
                                  color: Colors.blue.shade800,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'With your phone',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Column(children: [
                            Text(
                              'Take a photo',
                              style: TextStyle(
                                  color: Colors.blue.shade800,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'With your cam',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 200,
                        )
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 50))),
                      onPressed: () => context.go('/'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('FINISH'),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
