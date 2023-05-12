import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController email;
  const EmailTextField({super.key, required this.email});

  @override
  createState() => EmailTextFieldState();
}

class EmailTextFieldState extends State<EmailTextField> {
  bool isObscureText = true;
  Icon icon = const Icon(Icons.close);
  Color color = Colors.red;
  // ignore: unnecessary_string_escapes
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  build(context) {
    return TextField(
      controller: widget.email,
      decoration: InputDecoration(
          suffixIcon: icon,
          suffixIconColor: color,
          hintText: 'xxxx_xx@xxx.com'),
      onChanged: (value) => {
        if (emailRegExp.hasMatch(value))
          {
            setState(() {
              icon = const Icon(Icons.check);
              color = Colors.orange;
            })
          }
        else
          {
            setState(() {
              icon = const Icon(Icons.close);
              color = Colors.red;
            })
          }
      },
    );
  }
}
