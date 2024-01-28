import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupText extends StatelessWidget {
  const SignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('계정이 없으신가요?'),
        TextButton(
          onPressed: () => context.pushNamed(AuthRoutes.signup.name),
          child: const Text(
            '회원가입',
          ),
        ),
      ],
    );
  }
}
