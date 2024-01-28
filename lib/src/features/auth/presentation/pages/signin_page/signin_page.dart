import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signin_page/local_widgets/signup_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'local_widgets/email_field.dart';
import 'local_widgets/logo_text.dart';
import 'local_widgets/password_field.dart';
import 'local_widgets/sigin_button.dart';

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
            _FormPanel(),
          ],
        ),
      ),
    );
  }
}

class _FormPanel extends StatefulWidget {
  const _FormPanel({super.key});

  @override
  State<_FormPanel> createState() => __FormPanelState();
}

class __FormPanelState extends State<_FormPanel> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const EmailField(),
          const SizedBox(height: 10),
          const PasswordField(),
          const SignupText(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: SigninButton(
              formKey: _formKey,
            ),
          ),
        ],
      ),
    );
  }
}
