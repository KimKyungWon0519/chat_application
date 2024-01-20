import 'package:flutter/material.dart';

class SearchFriendField extends StatelessWidget {
  const SearchFriendField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '이름으로 유저 찾기',
              contentPadding: EdgeInsets.all(10),
            ),
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
