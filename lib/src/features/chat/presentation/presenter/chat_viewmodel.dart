import 'package:chat_application/src/features/chat/domain/usecase/chat_store_usecase.dart';

class ChatViewModel {
  final GetChatDataUseCase _getChatDataUseCase;

  ChatViewModel({
    required GetChatDataUseCase getChatDataUseCase,
  }) : _getChatDataUseCase = getChatDataUseCase;
}
