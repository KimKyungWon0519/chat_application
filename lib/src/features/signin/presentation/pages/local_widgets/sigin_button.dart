import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SigninButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: () {},
      child: const Text('로그인'),
    );
  }
}
