import 'package:dio/dio.dart';
import 'package:taller8/api/api_constants.dart';
import 'package:taller8/exceptions/exceptions.dart';
import 'package:taller8/models/response_login.dart';

class ApiService {
  static final Dio _dio = Dio();
  static String handleError(e) {
    String message = '';
    if (e is DioException) {
      // Comprobar si el error es debido a una respuesta no exitosa del servidor
      if (e.response != null) {
        message = e.response!.data["message"];
      } else {
        message = e.error.toString();
      }
    }
    if (e is ValidationException) {
      message = e.message;
    }
    return message;
  }

  static Future<ResponseLogin> loginUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw ValidationException("Email o password nulos");
      }
      const String endpoint = ApiConstants.BASE_URL + ApiConstants.LOGIN;
      final Map<String, dynamic> data = {"email": email, "pass": password};
      _dio.options.headers = ApiHeaders.headersBasic;
      Response response = await _dio.post(endpoint, data: data);
      return ResponseLogin.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

void main() async {
  try {
    ResponseLogin? loginResponse =
        await ApiService.loginUser("srealpe@elitenut.com", "1225*");
    final token = loginResponse.data.jsontoken;
    print(token);
  } catch (e) {
    if (e is DioException) {
      // Comprobar si el error es debido a una respuesta no exitosa del servidor
      if (e.response != null) {
        print(e.response!.data["message"]); // Imprimir cuerpo de la respuesta
        print(e.response!.statusCode); // Imprimir código de estado HTTP
        print(e.response!.headers); // Imprimir cabeceras
      } else {
        print(e.message);
      }
    }
    if (e is ValidationException) {
      print(e.message);
    }
  }
}
