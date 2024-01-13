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
}
