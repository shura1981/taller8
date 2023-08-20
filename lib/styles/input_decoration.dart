import 'package:flutter/material.dart';

class InputDecorationApp {
  static InputDecoration inputDecoratiooLogin(
      {required border,
      required labelText,
      required prefixIcon,
      required suffixIcon}) {
    return InputDecoration(
        border: border,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon);
  }
}
