import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/core/values/exceptions/add_friend_exception.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/friends_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsStoreRepositoryImpl extends FriendsStoreRepository {
  @override
  Future<void> addFriend(String uid) {
    User user = FirebaseAuth.instance.currentUser!;

    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.friends)
        .doc(user.uid)
        .get()
        .then((value) {
      List uids = [];

      if (value.data() != null) {
        uids = value.data()![FriendFieldKey.uids] ?? [];
      }

      if (uids.contains(uid)) throw const AlreadyFriendException();

      uids.add(uid);

      value.reference.set({FriendFieldKey.uids: uids});
    });
  }
}
