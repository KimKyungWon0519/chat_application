import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/chats/domain/repository/chats_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatsStoreRepositoryImpl extends ChatsStoreRepository {
  @override
  Future<String> createChat(List<Domain.UserInfo> users) {
    String myUid = FirebaseAuth.instance.currentUser!.uid;
    List<String> uids = [myUid, ...users.map((e) => e.uid).toList()];

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .add({ChatFieldKey.uids: uids}).then((value) => value.id);
  }

  @override
  Future<String?> getChatID(List<Domain.UserInfo> users) {
    String myUid = FirebaseAuth.instance.currentUser!.uid;
    List<String> uids = [myUid, ...users.map((e) => e.uid).toList()];

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .where(ChatFieldKey.uids, arrayContains: myUid)
        .get()
        .then((value) {
      List<QueryDocumentSnapshot> docsData = value.docs;

      for (QueryDocumentSnapshot documentSnapshot in docsData) {
        List<String> data = (documentSnapshot.get((ChatFieldKey.uids)) as List)
            .map((e) => e as String)
            .toList();

        if (listEquals(data, uids)) {
          return documentSnapshot.id;
        }
      }

      return null;
    });
  }
}
