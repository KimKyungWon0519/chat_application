import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UsersStoreRepository {
  Stream<QuerySnapshot<Object?>> getUsersSnapshot();
}
