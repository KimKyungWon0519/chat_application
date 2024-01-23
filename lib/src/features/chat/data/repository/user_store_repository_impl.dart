import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chat/domain/repository/user_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserStoreRepositoryImpl extends UserStoreRepository {
  @override
  Stream<String> getUserNameSnapshot(String uid) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(uid)
        .snapshots()
        .map((event) => event.get(UserFieldKey.name));
  }
}
