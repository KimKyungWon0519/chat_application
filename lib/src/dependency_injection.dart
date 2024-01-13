import 'package:chat_application/src/features/signin/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/signin/presentation/presenter/signin_viewmodel.dart';
import 'package:riverpod/riverpod.dart';

void initialize() {
  signinProvider = Provider((ref) => SigninViewModel());
}
