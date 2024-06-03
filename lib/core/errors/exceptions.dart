class ServerException implements Exception {}

class OfflineException implements Exception {}

class WrongAuthException implements Exception {
  final String title;
  final String message;

  WrongAuthException(this.title, this.message);
}
