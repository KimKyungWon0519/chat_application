import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Future<void> createUserInfo(String uid, String name) {
    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.users)
        .doc(uid)
        .set(
      {
        UserFieldKey.name: name,
        UserFieldKey.code: uid.substring(0, 6),
      },
    );
  }
}
