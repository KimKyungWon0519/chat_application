import 'package:chat_application/src/core/values/exceptions/base_exception.dart';
import 'package:flutter/material.dart';

class Dialogs {
  const Dialogs._();

  static Future showLoading(BuildContext context, bool isLoading) {
    return showDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: !isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  static Future showError(BaseException exception, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(exception.title),
        content: Text(exception.message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
