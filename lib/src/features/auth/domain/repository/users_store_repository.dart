import 'package:firebase_auth/firebase_auth.dart';

abstract class UsersStoreRepository {
  Future<void> createUserInfo(String uid, String name);
}
