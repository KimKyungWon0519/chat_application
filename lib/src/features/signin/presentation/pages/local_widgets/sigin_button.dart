import 'package:chat_application/src/core/utils/dialogs.dart';
import 'package:chat_application/src/core/values/exceptions/signin_exception.dart';
import 'package:chat_application/src/features/signin/presentation/presenter/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      onPressed: () => _onPressed(ref, context),
      child: const Text('로그인'),
    );
  }

  void _onPressed(WidgetRef ref, BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      bool isLoading = true;

      Dialogs.showLoading(context, isLoading);

      try {
        await ref.read(signinProvider).signin().whenComplete(() {
          isLoading = false;
          context.pop();
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' ||
            e.code == 'wrong-password' ||
            e.code == 'invalid-credential') {
          if (context.mounted) {
            Dialogs.showError(const InvalidCredentialException(), context);
          }
        } else {
          if (context.mounted) {
            Dialogs.showError(const UnknownException(), context);
          }
        }
      } catch (e) {
        if (context.mounted) {
          Dialogs.showError(const UnknownException(), context);
        }
      }
    }
  }
}
