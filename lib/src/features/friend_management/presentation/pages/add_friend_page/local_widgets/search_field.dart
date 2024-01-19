import 'package:chat_application/src/features/friend_management/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
            decoration: const InputDecoration(hintText: '친구 코드를 입력해주세요.'),
            maxLength: 6,
          ),
        ),
        Consumer(
          builder: (context, ref, child) => TextButton(
            onPressed: () => ref
                .read(addFriendProvider.notifier)
                .findUserWithCode(_controller.text),
            child: const Text('검색'),
          ),
        )
      ],
    );
  }
}
