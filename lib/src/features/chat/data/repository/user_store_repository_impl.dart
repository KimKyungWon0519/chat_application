import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/chat/domain/repository/user_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserStoreRepositoryImpl extends UserStoreRepository {
  @override
  Stream<String> getUserNameSnapshot(String uid) {
    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.users)
        .doc(uid)
        .snapshots()
        .map((event) => event.get(UserFieldKey.name));
  }
}
