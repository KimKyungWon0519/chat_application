import 'package:chat_application/src/features/auth/presentation/pages/signup_page/local_widgets/name_field.dart';
import 'package:flutter/material.dart';

import 'local_widgets/email_field.dart';
import 'local_widgets/logo_text.dart';
import 'local_widgets/password_field.dart';
import 'local_widgets/sigin_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
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
          const NameField(),
          const SizedBox(height: 10),
          const PasswordField(),
          const SizedBox(height: 10),
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
