import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'user_tile.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return StreamBuilder(
      stream: users.snapshots(),
      builder: (context, snapshot) {
        print(snapshot.data?.docs.first.data());

        return const UserTile();
      },
    );
  }
}
