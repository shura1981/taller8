import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final String name;
  final String email;

  const DrawerHeaderWidget(
      {super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.55), BlendMode.darken),
              fit: BoxFit.cover,
              image: Image.asset('assets/img/200099frederika.jpg').image)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
                'assets/img/maskable_icon.png'), // Reemplaza con la ruta de tu imagen de avatar
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
