import 'package:chat_application/src/core/values/exceptions/base_exception.dart';

abstract class SigninException extends BaseException {
  const SigninException(String message) : super('로그인 오류', message);
}

class InvalidCredentialException extends SigninException {
  const InvalidCredentialException() : super('이메일 혹은 비밀번호가 틀렸습니다.');
}

class UnknownException extends SigninException {
  const UnknownException() : super('알 수 없는 오류가 발생했습니다.');
}

class NetworkException extends SigninException {
  const NetworkException() : super('인터넷이 연결되지 않았습니다.');
}
