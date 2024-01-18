import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Future<void> createUserInfo(String uid, String name) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(uid)
        .set(
      {
        'name': name,
        'code': uid.substring(0, 6),
      },
    );
  }
}
