abstract class BaseException implements Exception {
  final String title;
  final String message;

  const BaseException(this.title, this.message);

  @override
  String toString() {
    return '$title : $message';
  }
}
