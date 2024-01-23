import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chat/domain/repository/chat_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatStoreRepositoryImpl extends ChatStoreRepository {
  @override
  Future<String> getChatName(String chatID) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .doc(chatID)
        .get()
        .then((value) async {
      String? name = value.get(ChatFieldKey.name);

      if (name == null || name.isEmpty) {
        name = await _getFriendName(value.get(ChatFieldKey.uids));
      }

      return name;
    });
  }

  @override
  Stream<List<String>> getTalkersSnapshot(String chatID) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .doc(chatID)
        .snapshots()
        .map(
      (event) {
        List<String> data = (event.get(ChatFieldKey.uids) as List)
            .map((e) => e as String)
            .toList();
        String myUid = FirebaseAuth.instance.currentUser!.uid;

        data.remove(myUid);
        data.insert(0, myUid);

        return data;
      },
    );
  }

  Future<String> _getFriendName(List uids) {
    uids.remove(FirebaseAuth.instance.currentUser!.uid);

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(uids.first)
        .get()
        .then(
          (value) => value.get(UserFieldKey.name),
        );
  }
}
