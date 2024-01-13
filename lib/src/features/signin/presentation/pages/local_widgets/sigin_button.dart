import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

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
