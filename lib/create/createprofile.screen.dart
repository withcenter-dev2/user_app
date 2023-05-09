import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  build(context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create an account',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: Row(children: const [
                  Icon(
                    Icons.radio_button_on,
                    color: Colors.green,
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2.0,
                  )),
                  Icon(
                    Icons.radio_button_off,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => context.go('/'),
                  iconSize: 16,
                  color: Colors.red,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('First Name',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'First Name',
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Last Name',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Email',
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Password',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Password',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Country',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Country',
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Birth Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: 230.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropdownButton(
                                  value: 'Month',
                                  items: <String>[
                                    'Month',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) => {},
                                ),
                                DropdownButton(
                                  value: 'Day',
                                  items: <String>[
                                    'Day',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) => {},
                                ),
                                DropdownButton(
                                  value: 'Year',
                                  items: <String>[
                                    'Year',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) => {},
                                )
                              ],
                            ))
                      ],
                    ),
                  ]),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    // ignore: avoid_types_as_parameter_names
                    Checkbox(value: true, onChanged: (bool) => {}),
                    const Flexible(
                      child: Text(
                          'Lorem ipsum dolor sit amet. Et dolorum esse ea autem necessitatibus sse ea autem necessitatibus enim. ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                    )
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    // ignore: avoid_types_as_parameter_names
                    Checkbox(value: true, onChanged: (bool) => {}),
                    const Flexible(
                      child: Text('Lorem ipsum dolor sit ecessitatibus enim. ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 50))),
                      onPressed: () => context.go('/add-avatar'),
                      child: Row(
                        children: const [
                          Expanded(child: 
                          Center(child: Text('NEXT')),),
                          Icon(Icons.arrow_forward_ios,size: 16,)
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
