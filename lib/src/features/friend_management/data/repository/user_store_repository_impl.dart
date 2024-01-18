import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/user_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Future<String> getMyCode() {
    User user = FirebaseAuth.instance.currentUser!;

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(user.uid)
        .get()
        .then((value) {
      return value.data()!['code'];
    });
  }
}
