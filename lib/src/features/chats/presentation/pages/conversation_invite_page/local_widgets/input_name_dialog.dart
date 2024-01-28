import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InputNmeDialog extends StatefulWidget {
  const InputNmeDialog({super.key});

  @override
  State<InputNmeDialog> createState() => _InputNmeDialogState();
}

class _InputNmeDialogState extends State<InputNmeDialog> {
  late final GlobalKey<FormState> _formKey;

  String _name = '';

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        title: const Text('채팅방 이름 설정'),
        content: TextFormField(
          decoration: const InputDecoration(hintText: '채팅방 이름을 설정해주세요.'),
          maxLength: 10,
          validator: _onValidator,
          onSaved: (newValue) => _name = newValue ?? '',
        ),
        actions: [
          TextButton(
            onPressed: _onPressed,
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  String? _onValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '채팅방 이름을 입력해주세요.';
    }

    return null;
  }

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.pop(_name);
    }
  }
}
