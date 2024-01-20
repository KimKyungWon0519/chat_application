import 'package:flutter/material.dart';

import 'local_widgets/friends_listview.dart';
import 'local_widgets/search_friend_field.dart';
import 'local_widgets/selected_count.dart';

class ConversationInvitePage extends StatelessWidget {
  const ConversationInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('대화 상대 초대'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchFriendField(),
            SelectedCount(),
            Expanded(
              child: FriendsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
