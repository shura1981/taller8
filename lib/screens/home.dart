import 'package:flutter/material.dart';
import 'package:taller8/share_preferences/preferences.dart';

import '../widgets/widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  static String name = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const MenuLateral(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('IsDarkMode:${Preferences.isDarkMode ? 'Si' : 'No'}'),
          const Divider(),
          Text('Género: ${Preferences.gender == 1 ? 'Masculino' : 'Femenino'}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          const Divider(),
        ],
      ),
    );
  }
}
