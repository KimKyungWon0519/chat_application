import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/chats/data/mapper/chat_info_mapper.dart';
import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/chats/domain/repository/chats_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatsStoreRepositoryImpl extends ChatsStoreRepository {
  @override
  Future<String> createChat(List<Domain.UserInfo> users, String? name) async {
    String myUid = FirebaseAuth.instance.currentUser!.uid;
    List<String> uids = [myUid, ...users.map((e) => e.uid).toList()];

    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.chats)
        .add({
      ChatFieldKey.uids: uids,
      ChatFieldKey.name: name,
    }).then((value) => value.id);
  }

  @override
  Future<String?> getChatID(List<Domain.UserInfo> users) {
    String myUid = FirebaseAuth.instance.currentUser!.uid;
    List<String> uids = [myUid, ...users.map((e) => e.uid).toList()];

    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.chats)
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

  @override
  Stream<List<ChatInfo>> getChatsSnapshot() {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.chats)
        .where(ChatFieldKey.uids, arrayContains: uid)
        .snapshots()
        .map((event) {
      List<ChatInfo> chats = [];
      List<QueryDocumentSnapshot<Map<String, dynamic>>> queryDocuments =
          event.docs;

      for (QueryDocumentSnapshot<Map<String, dynamic>> queryDocument
          in queryDocuments) {
        chats.add(queryDocument.data().toChatInfo(queryDocument.id));
      }

      return chats;
    });
  }
}
