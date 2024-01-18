import 'package:chat_application/src/features/friend_management/presentation/pages/add_friend_page/local_widgets/search_field.dart';
import 'package:flutter/material.dart';

import 'local_widgets/my_code_card.dart';

class AddFriendPage extends StatelessWidget {
  const AddFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('친구 추가'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            MyCodeCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(),
            ),
            SearchField(),
          ],
        ),
      ),
    );
  }
}
