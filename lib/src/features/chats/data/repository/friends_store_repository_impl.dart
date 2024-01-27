import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/chats/domain/repository/friends_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsStoreRepositoryImpl extends FriendsStoreRepository {
  @override
  Future<List> getAllFriends() {
    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.friends)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => value.data()![FriendFieldKey.uids]);
  }
}
