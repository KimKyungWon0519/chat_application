import 'package:chat_application/src/features/account_management/data/repository/auth_repository_impl.dart';
import 'package:chat_application/src/features/account_management/domain/repository/auth_repository.dart';
import 'package:chat_application/src/features/account_management/domain/usecase/auth_usecase.dart';
import 'package:chat_application/src/features/account_management/presentation/presenter/account_management_viewmodel.dart';
import 'package:chat_application/src/features/account_management/presentation/presenter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependecyInjection() {
  /* Start Initialize Repository */

  AuthRepository authRepository = AuthRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  AuthUseCase authUseCase = AuthUseCase(
    authRepository: authRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  accountManagementProvider = Provider((ref) => AccountManagementViewModel(
        authUseCase: authUseCase,
      ));

  /* End Initialize ViewModel */
}
