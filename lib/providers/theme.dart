// crear una clase provider para cambiar tema

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData? currentTheme;
  static ThemeData light = ThemeData.light().copyWith(
      primaryColor: Colors.lightBlue,
      colorScheme: const ColorScheme.light(
        primary: Colors.lightBlue,
        secondary: Colors.lightBlueAccent,
      ),
      primaryColorLight: Colors.lightBlueAccent,
      canvasColor: Colors.grey[300],
      brightness: Brightness.light);
  static ThemeData dark = ThemeData.dark().copyWith(
      primaryColor: Colors.lightGreen,
      primaryColorDark: Colors.lightGreenAccent,
      colorScheme: const ColorScheme.dark(
        primary: Colors.lightGreen,
        secondary: Colors.lightGreenAccent,
      ),
      canvasColor: const Color.fromARGB(255, 105, 105, 105),
      brightness: Brightness.dark);

  ThemeChanger({required bool isDarkMode})
      : currentTheme = isDarkMode ? dark : light;

  void setLightMode() {
    currentTheme = light;
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = dark;
    notifyListeners();
  }
}
