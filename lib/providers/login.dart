import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isObscure = true;
  bool _isValidPassword = true;

  bool isValidPassword() => _isValidPassword;

  void setIsValidPassword(bool isValidPassword) {
    _isValidPassword = isValidPassword;
    notifyListeners();
  }

  bool emailValid() => _email.isEmpty ? false : true;
  bool validatePassWord(String password) {
    // Requisito de longitud
    if (password.length < 5) {
      return false;
    }

    // Requisito de carácter especial. Los caracteres especiales son definidos dentro de los []
    final RegExp specialCharacterRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!specialCharacterRegExp.hasMatch(password)) {
      return false;
    }

    return true;
  }

  String get email => _email;
  String get password => _password;
  bool get isObscure => _isObscure;
  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  togglePasswordVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  // Aquí puedes agregar la lógica de inicio de sesión si es necesario
}
