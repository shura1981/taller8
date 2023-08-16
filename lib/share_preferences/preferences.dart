import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
// Obtain shared preferences.
  static late SharedPreferences _prefs;
  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;
  static String? _userJson;
  static String? _jwtLogin;
// getter and setter
  static String? get jwtLogin {
    return _prefs.getString('jwtLogin') ?? _jwtLogin;
  }

  static Future<bool> setJwtLogin(String? value) {
    _jwtLogin = value;
    return _prefs.setString('jwtLogin', value!);
  }

static Future<bool> clearJwtLogin() async {
    try {
      return await _prefs.remove('jwtLogin');
    } catch (error) {
      return false; // Devuelve false si hay un error
    }
  }

  static String? get userJson {
    return _prefs.getString('userJson') ?? _userJson;
  }

  static set userJson(String? value) {
    _userJson = value;
    _prefs.setString('userJson', value!);
  }

  static Future<bool> removeUserJson() async {
    try {
      return await _prefs.remove('userJson');
    } catch (error) {
      return false; // Devuelve false si hay un error
    }
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
