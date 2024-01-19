import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/friends_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsStoreRepositoryImpl extends FriendsStoreRepository {
  @override
  Future<void> addFriend(String uid) {
    User user = FirebaseAuth.instance.currentUser!;

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.friends)
        .doc(user.uid)
        .get()
        .then((value) {
      List uids = [];

      if (value.data() != null) {
        uids = value.data()!['uids'] ?? [];
      }

      uids.add(uid);

      value.reference.set({'uids': uids});
    });
  }
}
