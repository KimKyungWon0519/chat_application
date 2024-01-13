import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'password',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
