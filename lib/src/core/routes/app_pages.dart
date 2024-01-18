import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signin_page/signin_page.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signup_page/signup_page.dart';
import 'package:chat_application/src/features/chats/presentation/pages/chats_page/chats_page.dart';
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

  static const String _initializeRoute = AppRoutes.friends;
  static final _UserNotifiy _userNotifiy = _UserNotifiy();

  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.signin,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupPage(),
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.friends,
                builder: (context, state) => const FriendsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chats,
                builder: (context, state) => const ChatsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
        builder: (context, state, navigationShell) =>
            NavigatorPage(navigationShell),
      ),
      GoRoute(
        path: AppRoutes.settings + AppRoutes.friendManagement,
        builder: (context, state) => const FriendManagementPage(),
        routes: [
          GoRoute(
            path: AppRoutes.addFriend,
            builder: (context, state) => const AddFriendPage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      if ((state.fullPath ?? '') == _initializeRoute && !_userNotifiy.isLogin) {
        return AppRoutes.signin;
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
