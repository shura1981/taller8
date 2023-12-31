import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller8/screens/scand_bar_code.dart';
import 'package:taller8/screens/screens.dart';
import 'package:taller8/share_preferences/preferences.dart';

import '../providers/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu Example',
      initialRoute: Preferences.jwtLogin != null
          ? BarcodeScannerWidget.name
          : LoginScreen.name,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      darkTheme: ThemeChanger.dark,
      routes: {
        BarcodeScannerWidget.name: (context) => const BarcodeScannerWidget(),
        ProfileScreen.name: (context) => const ProfileScreen(),
        ConfigScreen.name: (context) => ConfigScreen(),
        LoginScreen.name: (context) => LoginScreen(),
        InputScreen.name: (context) => const InputScreen()
      },
    );
  }
}
