import 'package:chat_application/src/core/routes/app_path.dart';

final class AuthRoutes {
  const AuthRoutes._();

  static const AppPath signin = AppPath(
    name: 'signin',
    path: '/signin',
  );
  static const AppPath signup = AppPath(
    name: 'signup',
    path: '/signup',
  );
}

final class MainRoutes {
  const MainRoutes._();

  static const AppPath friends = AppPath(
    name: 'friends',
    path: '/friends',
  );
  static const AppPath chats = AppPath(
    name: 'chats',
    path: '/chats',
  );
  static const AppPath settings = AppPath(
    name: 'settings',
    path: '/settings',
  );
}

final class FriendManagementRoutes {
  const FriendManagementRoutes._();

  static final AppPath friendManagement = AppPath(
    name: 'friend_management',
    path: '${MainRoutes.settings.path}/friend_management',
  );
  static const AppPath addFriend = AppPath(
    name: 'add_friend',
    path: 'add_friend',
  );
}
