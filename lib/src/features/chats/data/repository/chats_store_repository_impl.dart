import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/chats/domain/repository/chats_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatsStoreRepositoryImpl extends ChatsStoreRepository {
  @override
  Future<String> createChat(List<Domain.UserInfo> users) {
    String myUid = FirebaseAuth.instance.currentUser!.uid;
    List<String> uids = [myUid, ...users.map((e) => e.uid).toList()];

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .add({ChatFieldKey.uids: uids}).then((value) => value.id);
  }
}
