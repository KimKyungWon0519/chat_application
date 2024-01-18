import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Future<void> createUserInfo(User user) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(user.uid)
        .set(
      {
        'name': user.displayName,
      },
    );
  }
}
