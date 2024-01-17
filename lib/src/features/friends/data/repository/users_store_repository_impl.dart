import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersStoreRepositoryImpl extends UsersStoreRepository {
  @override
  Stream<QuerySnapshot<Object?>> getUsersSnapshot() {
    return FirebaseFirestore.instance
        .collection(CloudFirestorePath.users)
        .snapshots();
  }
}
