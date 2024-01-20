import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/domain/repository/chats_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsStoreRepositoryImpl extends ChatsStoreRepository {
  @override
  Future<String> createChat(List<UserInfo> users) {
    List<String> uids = users.map((e) => e.uid).toList();

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .add({ChatFieldKey.uids: uids}).then((value) => value.id);
  }
}
