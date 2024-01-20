import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chats/domain/repository/friends_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsStoreRepositoryImpl extends FriendsStoreRepository {
  @override
  Future<List<String>> getAllFriends(String uid) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.friends)
        .doc(uid)
        .get()
        .then((value) => value.data()![FriendFieldKey.uids]);
  }
}
