import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller8/screens/screens.dart' show MyApp;

import 'providers/login.dart';
import 'providers/theme.dart';
import 'share_preferences/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger( isDarkMode:  Preferences.isDarkMode)),
      ChangeNotifierProvider(create: (_) => LoginModel())
    ], child: const MyApp()),
  );
}
