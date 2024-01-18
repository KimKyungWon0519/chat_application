import 'package:firebase_auth/firebase_auth.dart';

abstract class UsersStoreRepository {
  Future<void> createUserInfo(User user);
}
