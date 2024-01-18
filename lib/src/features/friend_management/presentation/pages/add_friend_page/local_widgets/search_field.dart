import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: '친구 코드를 입력해주세요.'),
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
