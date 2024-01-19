import 'package:chat_application/src/core/values/exceptions/base_exception.dart';

abstract class AddFriendException extends BaseException {
  const AddFriendException(String message) : super('친구 추가 오류', message);
}

class UnknownException extends AddFriendException {
  const UnknownException() : super('알 수 없는 오류가 발생했습니다.');
}
