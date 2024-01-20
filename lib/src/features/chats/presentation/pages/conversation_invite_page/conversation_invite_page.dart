import 'package:flutter/material.dart';

import 'local_widgets/friends_listview.dart';
import 'local_widgets/okay_button.dart';
import 'local_widgets/search_friend_field.dart';
import 'local_widgets/selected_friends_expansion_tile.dart';

class ConversationInvitePage extends StatelessWidget {
  const ConversationInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('대화 상대 초대'),
        actions: const [
          OkayButton(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchFriendField(),
            SelectedFriendsExpansionTile(),
            Expanded(
              child: FriendsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
