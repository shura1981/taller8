import 'package:flutter/material.dart';

Function kTextStyle = (BuildContext context, double size, FontWeight weight) {
  return TextStyle(
    color: Theme.of(context).primaryColor,
    fontSize: size,
    fontWeight: weight,
  );
};