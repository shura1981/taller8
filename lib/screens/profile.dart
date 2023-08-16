import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class ProfileScreen extends StatelessWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);
  static String name='ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(title: const Text('ProfileScreen'),),
  drawer: const MenuLateral(),
      body: const Center(
         child: Text('ProfileScreen'),
      ),
    );
  }
}