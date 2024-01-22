import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/chats/domain/repository/users_store_repository.dart';
import 'package:chat_application/src/features/chats/data/mapper/user_info_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Future<Domain.UserInfo> getUserInfo(String uid) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(uid)
        .get()
        .then(
          (value) => value.data()!.toUserInfo(uid),
        );
  }

  @override
  String getMyUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
