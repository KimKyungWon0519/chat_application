import 'package:chat_application/src/features/chats/domain/usecase/chats_usecase.dart';

class ChatsViewModel {
  final GetChatUseCase _getChatUseCase;

  ChatsViewModel({
    required GetChatUseCase getChatUseCase,
  }) : _getChatUseCase = getChatUseCase;
}
