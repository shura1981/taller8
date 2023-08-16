// api_constants.dart
class ApiConstants {
  static const BASE_URL = 'https://apireto200millones.nutramerican.com/';
  static const LOGIN = 'usuario/login';
  // ... otras rutas o constantes
}

// api_constants.dart
class ApiHeaders {
  static const Map<String, dynamic> headersBasic = {
    'Authorization': 'Basic cmV0bzIwMG1pbGxvbmVzOjJOeng3OGRtTWRTbQ==',
    'Content-Type': 'application/json',
  };

  static const Map<String, dynamic> headersBearer = {
    'Authorization': 'Bearer cmV0bzIwMG1pbGxvbmVzOjJOeng3OGRtTWRTbQ==',
    'Content-Type': 'application/json',
  };
}
