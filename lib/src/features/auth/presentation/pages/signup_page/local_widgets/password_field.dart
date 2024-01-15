import 'package:chat_application/src/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField extends ConsumerStatefulWidget {
  const PasswordField({super.key});

  @override
  ConsumerState<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends ConsumerState<PasswordField> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'password',
        suffixIcon: IconButton(
          icon: Icon(_isObscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {},
      validator: (value) => Validator.passwordValidator(value),
      obscureText: _isObscureText,
    );
  }
}
