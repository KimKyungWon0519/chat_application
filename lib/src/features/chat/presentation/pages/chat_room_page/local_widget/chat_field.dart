import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatField extends ConsumerStatefulWidget {
  const ChatField({super.key});

  @override
  ConsumerState<ChatField> createState() => _ChatFieldState();
}

class _ChatFieldState extends ConsumerState<ChatField> {
  late final TextEditingController _controller;

  bool _isCanSend = false;

  @override
  void initState() {
    super.initState();

    print(DateTime.parse('2024-01-24T13:18:23.914416'));

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: _onChanged,
          ),
        ),
        TextButton(
          onPressed: _isCanSend ? _onPressed : null,
          child: const Text('전송'),
        ),
      ],
    );
  }

  void _onChanged(String value) {
    bool newValue = value.trim().isNotEmpty;

    if (_isCanSend != newValue) {
      setState(() {
        _isCanSend = newValue;
      });
    }
  }

  void _onPressed() async {
    try {
      DateTime dateTime = await ref.read(chatProvider).getRealTime();

      print(dateTime);
    } catch (e) {
      return;
    }
  }
}
