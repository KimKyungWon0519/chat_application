// ignore_for_file: use_build_context_synchronously

import 'package:chat_application/src/core/constants/firebase_auth_error_code.dart';
import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/utils/dialogs.dart';
import 'package:chat_application/src/core/values/exceptions/base_exception.dart';
import 'package:chat_application/src/core/values/exceptions/signin_exception.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

      await _signinEvent(context, ref);
    }
  }

  Future<void> _signinEvent(BuildContext context, WidgetRef ref) async {
    bool isLoading = true;

    Dialogs.showLoading(context, isLoading);

    try {
      await ref.read(signinProvider).signin().whenComplete(() {
        isLoading = false;
        context.pop();
      });

      context.go(AppRoutes.friends);
    } on FirebaseAuthException catch (e) {
      if (_isInvalidCredential(e.code)) {
        Dialogs.showError(const InvalidCredentialException(), context);
        return;
      }

      if (e.code == FirebaseAuthErrorCode.networkRequestFailed) {
        Dialogs.showError(const NetworkException(), context);
        return;
      }

      Dialogs.showError(const UnknownException(), context);
    } catch (e) {
      if (e is NotVerifiedMail) {
        Dialogs.showError(e, context);

        return;
      }

      Dialogs.showError(const UnknownException(), context);
    }
  }

  bool _isInvalidCredential(String errorCode) {
    return errorCode == FirebaseAuthErrorCode.userNotFound ||
        errorCode == FirebaseAuthErrorCode.wrongPassword ||
        errorCode == FirebaseAuthErrorCode.invalidCredential;
  }
}
