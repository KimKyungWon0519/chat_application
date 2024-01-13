import 'package:chat_application/features/signin/presentatin/pages/local_widgets/email_field.dart';
import 'package:chat_application/features/signin/presentatin/pages/local_widgets/logo_text.dart';
import 'package:chat_application/features/signin/presentatin/pages/local_widgets/password_field.dart';
import 'package:chat_application/features/signin/presentatin/pages/local_widgets/sigin_button.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: LogoText(),
            ),
            EmailField(),
            SizedBox(height: 10),
            PasswordField(),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: SigninButton(),
            ),
          ],
        ),
      ),
    );
  }
}
