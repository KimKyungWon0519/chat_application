import 'package:chat_application/src/core/constants/regexp_source.dart';

class Validator {
  const Validator._();

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'email을 입력해주세요';
    } else if (!RegExp(RegExpSource.emailRegExp).hasMatch(value)) {
      return '올바른 email을 입력해주세요.';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'password를 입력해주세요.';
    } else if (!RegExp(RegExpSource.passwordRegExp).hasMatch(value)) {
      return '특수문자, 대소문자, 숫자 포함 6자 이상 12자 이내로 입력하세요.';
    }
    return null;
  }
}
