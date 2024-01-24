import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/friends/domain/repository/friends_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsStoreRepositoryImpl extends FriendsStoreRepository {
  @override
  Stream<List> getFriendsSnapshot() {
    User user = FirebaseAuth.instance.currentUser!;

    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.friends)
        .doc(user.uid)
        .snapshots()
        .map((event) => event.data()![FriendFieldKey.uids]);
  }
}
