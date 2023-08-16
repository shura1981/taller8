// crear una clase provider para cambiar tema

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData? currentTheme;
  static ThemeData light= ThemeData.light().copyWith(primaryColor: Colors.lightBlue);
  static ThemeData dark= ThemeData.dark().copyWith(primaryColor: const Color.fromARGB(255, 3, 244, 148), 
  navigationBarTheme: const NavigationBarThemeData(backgroundColor: Color.fromARGB(255, 3, 244, 148)) );

  ThemeChanger({required bool isDarkMode})
      : currentTheme = isDarkMode ? dark: light;

  void setLightMode() {
    currentTheme = light;
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = dark;
    notifyListeners();
  }
}
