import 'package:flutter/material.dart';

import 'local_widgets/friends_listview.dart';
import 'local_widgets/my_tile.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('친구'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              MyTile(),
              Divider(),
              FriendsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
