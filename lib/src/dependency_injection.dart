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

void initialize() {
  Auth.initializeDependencyInjection();
  Friends.initializeDependencyInjection();
  FriendManagement.initializeDependencyInjection();
  AccountManagement.initializeDependecyInjection();
  Chats.intializeDependencyInjection();
  Chat.initializeDependencyInjection();
}
