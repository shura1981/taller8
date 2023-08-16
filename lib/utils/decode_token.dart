import 'package:jwt_decoder/jwt_decoder.dart';

class Jwt {
  static Map<String, dynamic> decodedToken(String token) {
    return JwtDecoder.decode(token);
  }

  static bool isExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  static DateTime expirationDate(String token) {
    return JwtDecoder.getExpirationDate(token);
  }

  // Returns a Duration representing the number of seconds
  // until the JWT token expires.
  static Duration tokenTimeLeft(String token) {
    return JwtDecoder.getTokenTime(token);
  }
}

void main() {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsIm5hbWUiOiJTVEVWRU4gUkVBTFBFIiwicm9sIjoiQURNSU4iLCJpYXQiOjE2OTE2MDg5NzMsImV4cCI6MTY5Njc5Mjk3M30.88KeJJhoi8usl1KQKyQT6uC7p_0GxhPvwCkgUh1yZHA';

  final decodeToken = Jwt.decodedToken(token);
  final isExpired = Jwt.isExpired(token);
  final expirationDate = Jwt.expirationDate(token);
  final tokenTimeLeft = Jwt.tokenTimeLeft(token);
  print("$decodeToken, $isExpired, $expirationDate, ${tokenTimeLeft.inDays}");
}
