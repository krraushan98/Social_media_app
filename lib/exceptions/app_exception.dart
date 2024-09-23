
class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException([this.message = '', this.prefix]);

  String toString() {
    return '$prefix$message';
  }
}