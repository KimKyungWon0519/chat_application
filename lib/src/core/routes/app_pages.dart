import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/features/account_management/presentation/pages/account_management_page/account_management_page.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signin_page/signin_page.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signup_page/signup_page.dart';
import 'package:chat_application/src/features/chats/presentation/pages/chats_page/chats_page.dart';
import 'package:chat_application/src/features/chats/presentation/pages/conversation_invite_page/conversation_invite_page.dart';
import 'package:chat_application/src/features/friend_management/presentation/pages/add_friend_page/add_friend_page.dart';
import 'package:chat_application/src/features/friend_management/presentation/pages/friend_management_page/friend_managemant_page.dart';
import 'package:chat_application/src/features/friends/presentation/pages/friends_page/friends_page.dart';
import 'package:chat_application/src/features/navigator/presentation/pages/navigator_page/navigator_page.dart';
import 'package:chat_application/src/features/settings/presentation/pages/settings_page/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppPages {
  const AppPages._();

  static final String _initializeRoute = MainRoutes.friends.path;
  static final _UserNotifiy _userNotifiy = _UserNotifiy();

  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AuthRoutes.signin.path,
        name: AuthRoutes.signin.name,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: AuthRoutes.signup.path,
        name: AuthRoutes.signup.name,
        builder: (context, state) => const SignupPage(),
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainRoutes.friends.path,
                name: MainRoutes.friends.name,
                builder: (context, state) => const FriendsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainRoutes.chats.path,
                name: MainRoutes.chats.name,
                builder: (context, state) => const ChatsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainRoutes.settings.path,
                name: MainRoutes.settings.name,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
        builder: (context, state, navigationShell) =>
            NavigatorPage(navigationShell),
      ),
      GoRoute(
        path: ChatsSubRoutes.conversationInvite.path,
        name: ChatsSubRoutes.conversationInvite.name,
        builder: (context, state) => const ConversationInvitePage(),
      ),
      GoRoute(
        path: FriendManagementRoutes.friendManagement.path,
        name: FriendManagementRoutes.friendManagement.name,
        builder: (context, state) => const FriendManagementPage(),
        routes: [
          GoRoute(
            path: FriendManagementRoutes.addFriend.path,
            name: FriendManagementRoutes.addFriend.name,
            builder: (context, state) => const AddFriendPage(),
          ),
        ],
      ),
      GoRoute(
        path: AccountManagementRoutes.accountManagement.path,
        name: AccountManagementRoutes.accountManagement.name,
        builder: (context, state) => const AccountManagementPage(),
      ),
    ],
    redirect: (context, state) {
      if ((state.fullPath ?? '') == _initializeRoute && !_userNotifiy.isLogin) {
        return AuthRoutes.signin.path;
      }

      return null;
    },
    refreshListenable: _userNotifiy,
    initialLocation: _initializeRoute,
  );
}

class _UserNotifiy extends ChangeNotifier {
  bool isLogin = false;

  _UserNotifiy() {
    FirebaseAuth.instance.userChanges().listen((event) {
      bool data = event != null;

      if (isLogin != data) {
        isLogin = data;
        notifyListeners();
      }
    });
  }
}
