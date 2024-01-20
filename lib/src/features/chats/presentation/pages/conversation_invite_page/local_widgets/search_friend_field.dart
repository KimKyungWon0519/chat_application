import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFriendField extends StatefulWidget {
  const SearchFriendField({super.key});

  @override
  State<SearchFriendField> createState() => _SearchFriendFieldState();
}

class _SearchFriendFieldState extends State<SearchFriendField> {
  late final TextEditingController _controller;

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
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '이름으로 유저 찾기',
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => TextButton(
            onPressed: () {
              ref
                  .read(conversationInviteProvider.notifier)
                  .searchUserWithName(_controller.text);
            },
            child: const Text('검색'),
          ),
        ),
      ],
    );
  }
}
