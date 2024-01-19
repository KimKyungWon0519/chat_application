import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: '친구 코드를 입력해주세요.'),
            maxLength: 6,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('검색'),
        ),
      ],
    );
  }
}
