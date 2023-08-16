import 'package:flutter/material.dart';

double getMaxWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  // Consideramos tablet si el ancho es mayor a 600 y menor o igual a 1024
  if (width > 600 && width <= 1024) {
    return 600;
  }
  // Consideramos desktop si el ancho es mayor a 1024
  else if (width > 1024) {
    return 400;
  }
  // Por defecto, no limitamos el ancho para dispositivos más pequeños
  else {
    return width;
  }
}

Future<void> showLoadingDialog(context, {msg = 'Validando...'}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                Text(msg),
              ],
            ),
          ));
    },
  );
}

void mostrarError(BuildContext context, String mensaje) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensaje),
      backgroundColor: Colors.red,
    ),
  );
}
