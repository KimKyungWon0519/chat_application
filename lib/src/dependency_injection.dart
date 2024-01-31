import 'package:chat_application/src/core/constants/app_constants.dart';
import 'package:chat_application/src/features/auth/dependency_injection.dart'
    as Auth;
import 'package:chat_application/src/features/friends/dependency_injection.dart'
    as Friends;
import 'package:chat_application/src/features/friend_management/dependency_injection.dart'
    as FriendManagement;
import 'package:chat_application/src/features/account_management/dependency_injection.dart'
    as AccountManagement;
import 'package:chat_application/src/features/chats/dependency_injection.dart'
    as Chats;
import 'package:chat_application/src/features/chat/dependency_injection.dart'
    as Chat;
import 'package:package_info_plus/package_info_plus.dart';

Future<void> initialize() async {
  packageInfo = await PackageInfo.fromPlatform();

  Auth.initializeDependencyInjection();
  Friends.initializeDependencyInjection();
  FriendManagement.initializeDependencyInjection();
  AccountManagement.initializeDependecyInjection();
  Chats.intializeDependencyInjection();
  Chat.initializeDependencyInjection();
}
