import 'package:chat_application/src/features/chat/data/repository/chats_realtime_db_repository_impl.dart';
import 'package:chat_application/src/features/chat/domain/repository/chats_realtime_db_repository.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatField extends ConsumerStatefulWidget {
  final String chatID;

  const ChatField(this.chatID, {super.key});

  @override
  ConsumerState<ChatField> createState() => _ChatFieldState();
}

class _ChatFieldState extends ConsumerState<ChatField> {
  late final TextEditingController _controller;

  bool _isCanSend = false;

  @override
  void initState() {
    super.initState();

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
    FocusScope.of(context).unfocus();

    try {
      ref.read(chatProvider).senMessage(widget.chatID, _controller.text);
      _controller.clear();
      _isCanSend = false;
    } catch (e) {
      return;
    }
  }
}
