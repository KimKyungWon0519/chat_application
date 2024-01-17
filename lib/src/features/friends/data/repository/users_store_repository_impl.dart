import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friends/data/mapper/users_info_mapper.dart';
import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Stream<List<UserInfo>> getUsersSnapshot() {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data().toModel()).toList());
  }
}
