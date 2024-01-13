import 'package:chat_application/src/core/utils/validator.dart';
import 'package:chat_application/src/features/signin/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/signin/presentation/presenter/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField extends ConsumerStatefulWidget {
  const PasswordField({super.key});

  @override
  ConsumerState<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends ConsumerState<PasswordField> {
  @override
  Widget build(BuildContext context) {
    SigninViewModel signinViewModel = ref.read(signinProvider);

    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'password',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => signinViewModel.password = newValue ?? '',
      validator: (value) => Validator.passwordValidator(value),
      obscureText: true,
    );
  }
}
