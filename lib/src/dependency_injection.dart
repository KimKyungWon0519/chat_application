import 'package:chat_application/src/features/auth/dependency_injection.dart'
    as Auth;
import 'package:chat_application/src/features/friends/dependency_injection.dart'
    as Friends;

void initialize() {
  Auth.initializeDependencyInjection();
  Friends.initializeDependencyInjection();
}
