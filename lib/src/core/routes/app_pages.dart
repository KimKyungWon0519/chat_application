import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/features/signin/presentation/pages/signin_page.dart';
import 'package:go_router/go_router.dart';

final class AppPages {
  const AppPages._();

  static const String _initializeRoute = AppRoutes.signin;

  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.signin,
        builder: (context, state) => const SigninPage(),
      ),
    ],
    initialLocation: _initializeRoute,
  );
}
