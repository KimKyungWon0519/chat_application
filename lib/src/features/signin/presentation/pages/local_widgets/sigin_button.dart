import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const SigninButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: () => _onPressed(ref),
      child: const Text('로그인'),
    );
  }

  void _onPressed(WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
