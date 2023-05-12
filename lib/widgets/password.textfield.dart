import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController password;
  const PasswordTextField({super.key, required this.password});

  @override
  createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;
  Icon icon = const Icon(Icons.visibility);

  @override
  build(context) {
    return TextField(
      controller: widget.password,
      obscureText: isObscureText,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => {
              setState(() {
                if (isObscureText) {
                  icon = const Icon(Icons.visibility);
                  isObscureText = false;
                } else {
                  icon = const Icon(Icons.visibility_off);
                  isObscureText = true;
                }
              })
            },
            icon: icon,
          ),
          suffixIconColor: Colors.black38,
          hintText: '******'),
    );
  }
}
