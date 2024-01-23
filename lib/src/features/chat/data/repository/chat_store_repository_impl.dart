import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chat/domain/repository/chat_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatStoreRepositoryImpl extends ChatStoreRepository {
  @override
  Future<String> getChatName(String chatID) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.chats)
        .doc(chatID)
        .get()
        .then((value) => value.get(ChatFieldKey.name));
  }
}
