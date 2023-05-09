import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> days = List.generate(31, (index) {
    int result;
    result = index + 1;
    return '$result';
  });

  List<String> years = ['2020', '2021', '2022'];

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
                    const MyTextField(
                        text: 'First Name',
                        hintText: 'First Name',
                        obscureText: false),
                    const SizedBox(height: 15.0),
                    const MyTextField(
                        text: 'Last Name',
                        hintText: 'Last Name',
                        obscureText: false),
                    const SizedBox(height: 15.0),
                    const MyTextField(
                        text: 'Email', hintText: 'Email', obscureText: false),
                    const SizedBox(height: 15.0),
                    const MyTextField(
                        text: 'Password',
                        hintText: 'Password',
                        obscureText: true),
                    const SizedBox(height: 15.0),
                    const MyTextField(
                        text: 'Password',
                        hintText: 'Password',
                        obscureText: true),
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
                                MyDropDownButton(list: months, hint: 'Month'),
                                MyDropDownButton(list: days, hint: 'Day'),
                                MyDropDownButton(list: years, hint: 'Year')
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
                          Expanded(
                            child: Center(child: Text('NEXT')),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          )
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

class MyTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
            width: 230.0,
            child: TextField(
              textAlign: TextAlign.center,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
              ),
            ))
      ],
    );
  }
}

class MyDropDownButton extends StatelessWidget {
  final List<String> list;
  final String hint;
  const MyDropDownButton({super.key, required this.list, required this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: null,
      hint: Text(hint),
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      // ignore: avoid_print
      onChanged: (value) => print(value),
    );
  }
}
