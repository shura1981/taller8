import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:taller8/exceptions/exceptions.dart';
import 'package:taller8/models/product.dart';
import 'package:taller8/overrides/http.override.dart';

class ApiCodeBarService {
  static final Dio _dio = Dio();

  static const baseUrl = "https://elitenutapp.com/";
  static const headers = {
    'Authorization':
        'Basic Y2tfZGJjMDI5ZTA2ZWJmZTdmNjg5YjJmZTRiOGJkNzhjNWEyNzlhN2IxYjpjc180ODhjOTNjOTlhOTE3OTc4NzU4N2Y0NmIzYmIyNWZkYzNmYzdlZDBj'
  };
  static String handleError(e) {
    String message = '';
    if (e is DioException) {
      // Comprobar si el error es debido a una respuesta no exitosa del servidor
      if (e.response != null) {
        message = e.response!.data["message"];
      } else {
        message = "Error de conexión";
      }
    }
    if (e is ValidationException) {
      message = e.message;
    }
    return message;
  }

  static Future<Product> codeBar(String code) async {
    try {
      if (code.isEmpty) {
        throw ValidationException("el código de barras es requerido");
      }
      final String endpoint =
          "${ApiCodeBarService.baseUrl}app/codebar?code=$code";
      _dio.options.headers = ApiCodeBarService.headers;
      _dio.options.contentType = Headers.jsonContentType;
      Response response = await _dio.get(endpoint);
      return Product.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

Future<void> test() async {
  var headers = {
    'Authorization':
        'Basic Y2tfZGJjMDI5ZTA2ZWJmZTdmNjg5YjJmZTRiOGJkNzhjNWEyNzlhN2IxYjpjc180ODhjOTNjOTlhOTE3OTc4NzU4N2Y0NmIzYmIyNWZkYzNmYzdlZDBj'
  };
  var dio = Dio();

  var response = await dio.request(
    'https://elitenutapp.com/app/codebar?code=7707394713945',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  } else {
    print(response.statusMessage);
  }
}

void main() async {
  try {
    HttpOverrides.global = MyHttpOverrides();
    Product product = await ApiCodeBarService.codeBar("7707394713945");
    print(product.toJson());
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
