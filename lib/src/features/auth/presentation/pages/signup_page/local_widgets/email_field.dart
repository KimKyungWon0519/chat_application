import 'package:chat_application/src/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'email',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {},
      validator: (value) => Validator.emailValidator(value),
    );
  }
}
