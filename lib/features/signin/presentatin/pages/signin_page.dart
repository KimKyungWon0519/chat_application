import 'package:chat_application/features/signin/presentatin/pages/local_widgets/title.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LogoText(),
          ),
        ],
      ),
    );
  }
}
