import 'dart:convert';

import 'package:taller8/share_preferences/preferences.dart';

class Usuario {
  // Atributos de la clase
  String correo;
  String contrasena;

  // Constructor privado
  Usuario._internal(this.correo, this.contrasena);

  // Instancia estática privada
  static final Usuario _instance = Usuario._internal("", "");

  // Método factory para obtener la única instancia
  factory Usuario({required String correo, required String contrasena}) {
    _instance.correo = correo;
    _instance.contrasena = contrasena;
    return _instance;
  }

  // Método estático para acceder a la instancia única
  static Usuario get instance => _instance;
// convert to json
  Map<String, dynamic> toJson() => {
        "correo": correo,
        "contrasena": contrasena,
      };

  Usuario fromJson(Map<String, dynamic> json) => Usuario(
        correo: json["correo"],
        contrasena: json["contrasena"],
      );

  static bool save(Usuario user) {
    try {
      Preferences.userJson = jsonEncode(user.toJson());
    } catch (e) {
      rethrow;
    }
    return true;
  }

  static Usuario? getUser() {
    try {
      final userJson = Preferences.userJson;
      if (userJson != null) {
        final user = Usuario.instance.fromJson(jsonDecode(userJson));
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}


// // Crear una instancia del usuario
//   var user1 = Usuario(correo: "test@example.com", contrasena: "password123");

//   // Acceder a la instancia única desde otro lugar en el código
//   var user2 = Usuario.instance;

//   // Las dos variables user1 y user2 apuntarán a la misma instancia
//   print(user1.correo);  // Output: test@example.com
//   print(user2.correo);  // Output: test@example.com