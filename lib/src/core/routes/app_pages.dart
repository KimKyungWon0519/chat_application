import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signin_page/signin_page.dart';
import 'package:chat_application/src/features/auth/presentation/pages/signup_page/signup_page.dart';
import 'package:chat_application/src/features/main/presentation/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppPages {
  const AppPages._();

  static const String _initializeRoute = AppRoutes.signin;
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
      GoRoute(
        path: AppRoutes.init,
        builder: (context, state) => const MainPage(),
      )
    ],
    redirect: (context, state) {
      if (_userNotifiy.isLogin) {
        return AppRoutes.signin;
      }

      return AppRoutes.init;
    },
    refreshListenable: _userNotifiy,
    initialLocation: _initializeRoute,
  );
}

class _UserNotifiy extends ChangeNotifier {
  bool isLogin = false;

  _UserNotifiy() {
    FirebaseAuth.instance.userChanges().listen((event) {
      isLogin = event != null;
    });
  }
}
