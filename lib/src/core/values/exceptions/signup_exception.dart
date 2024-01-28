import 'package:chat_application/src/core/values/exceptions/base_exception.dart';

abstract class SignupException extends BaseException {
  const SignupException(String message) : super('회원가입 오류', message);
}

class EmailAlreadyInUse extends SignupException {
  const EmailAlreadyInUse() : super('이미 존재하는 이메일입니다.');
}

class NetworkException extends SignupException {
  const NetworkException() : super('인터넷이 연결되지 않았습니다.');
}

class UnknownException extends SignupException {
  const UnknownException() : super('알 수 없는 오류가 발생했습니다.');
}
