// ignore_for_file: use_build_context_synchronously

import 'package:chat_application/src/core/constants/firebase_auth_error_code.dart';
import 'package:chat_application/src/core/utils/dialogs.dart';
import 'package:chat_application/src/core/values/exceptions/signup_exception.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const SignupButton({
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
      child: const Text('회원가입'),
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
      await ref.read(signupProvider).signup().whenComplete(() {
        isLoading = false;
        context.pop();
      });

      _showFinishDialog(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthErrorCode.emailAlreadyInUse) {
        Dialogs.showError(const EmailAlreadyInUse(), context);
        return;
      }

      if (e.code == FirebaseAuthErrorCode.networkRequestFailed) {
        Dialogs.showError(const NetworkException(), context);
        return;
      }

      Dialogs.showError(const UnknownException(), context);
    } catch (e) {
      Dialogs.showError(const UnknownException(), context);
    }
  }

  void _showFinishDialog(BuildContext context) {
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('회원가입 완료'),
        content: const Text(
          '메일함에서 인증 메일을 확인해주세요.\n이메일 인증 후 Talk-Track의 모든 기능이 이용 가능합니다.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    ).then((value) => context.pop());
  }
}
