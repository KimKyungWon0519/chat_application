import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/user_store_repository.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/friend_management/data/mapper/user_info_mapper.dart';
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

  @override
  Future<Domain.UserInfo?> getUserWithCode(String code) {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .where('code', isEqualTo: code)
        .get()
        .then((value) {
      if (value.docs.isEmpty) return null;

      if (value.docs.first.id == FirebaseAuth.instance.currentUser!.uid) {
        return null;
      }

      return value.docs.first.data().toUserInfo(value.docs.first.id);
    });
  }
}
