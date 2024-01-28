import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/friends/data/mapper/user_info_mapper.dart';
import 'package:chat_application/src/features/friends/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Stream<Domain.UserInfo> getMyUserInfoSnapshot() {
    User user = FirebaseAuth.instance.currentUser!;

    return getUserInfoSnapshot(user.uid);
  }

  @override
  Stream<Domain.UserInfo> getUserInfoSnapshot(String uid) {
    return FirebaseFirestore.instance
        .collection(FirestoreDatabasePath.users)
        .doc(uid)
        .snapshots()
        .map((event) => event.data()!.toUserInfo(uid));
  }
}
