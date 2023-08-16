import 'package:flutter/material.dart';

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
      body: const Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('IsDarkMode:'),
          Divider(),
          Text('Género:'),
          Divider(),
          Text('Nombre de usuario:'),
          Divider(),
        ],
      ),
    );
  }
}

