import 'package:flutter/material.dart';
import 'package:taller8/screens/screens.dart';
import 'package:taller8/share_preferences/preferences.dart';

import 'widget.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeaderWidget(
            name: 'Nombre del Usuario',
            email: 'usuario@example.com',
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Agrega aquí la lógica para manejar la selección del elemento del menú
              // Navigate Name
              Navigator.pushReplacementNamed(context, MyHomePage.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Agrega aquí la lógica para manejar la selección del elemento del menú
              Navigator.pushReplacementNamed(context, ProfileScreen.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Config'),
            onTap: () {
              // Agrega aquí la lógica para manejar la selección del elemento del menú
              Navigator.pushReplacementNamed(context, ConfigScreen.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Close Session'),
            onTap: () {
              Preferences.clearJwtLogin().then((value) {
                if (value) {
                  Navigator.pushReplacementNamed(context, LoginScreen.name);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al cerrar sesión'),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
