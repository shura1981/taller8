class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return "HttpException: $message";
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return "AuthException: $message";
  }
}

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);

  @override
  String toString() {
    return "ValidationException: $message";
  }
}
