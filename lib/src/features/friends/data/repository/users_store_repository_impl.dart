import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friends/domain/model/user_info.dart'
    as Domain;
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Stream<List<Domain.UserInfo>> getUsersSnapshot() {
    throw UnimplementedError();
  }

  @override
  Stream<Domain.UserInfo> getMyUserInfoSnapshot() {
    User user = FirebaseAuth.instance.currentUser!;

    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .doc(user.uid)
        .snapshots()
        .map(
          (event) => Domain.UserInfo(
            name: event.data()!['name'],
            onelineInfo: event.data()!['oneline_info'],
            uid: user.uid,
          ),
        );
  }
}
