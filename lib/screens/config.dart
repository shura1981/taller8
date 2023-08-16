import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme.dart';
import '../share_preferences/preferences.dart';
import '../styles/inputdecorations.dart';
import '../styles/text.dart';
import '../widgets/widget.dart';

class ConfigScreen extends StatelessWidget {
  ConfigScreen({Key? key}) : super(key: key);
  static String name = 'ConfigScreen';

  final ValueNotifier<String> textNotifier =
      ValueNotifier<String>(Preferences.name);
  final ValueNotifier<bool> switchNotifier =
      ValueNotifier<bool>(Preferences.isDarkMode);
  final ValueNotifier<int> radioNotifier =
      ValueNotifier<int>(Preferences.gender);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ConfigScreen'),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ConfigScreen',
                style: kTextStyle(context, 40.0, FontWeight.w300),
              ),
              const SizedBox(height: 40),
              const Divider(),
              ValueListenableBuilder<bool>(
                valueListenable: switchNotifier,
                builder: (context, value, child) {
                  return Switch.adaptive(
                      value: value,
                      onChanged: (value) {
                        switchNotifier.value = value;
                        Preferences.isDarkMode = value;
                        value 
                        ? themeProvider.setDarkMode() 
                        : themeProvider.setLightMode();
                      });
                },
              ),
              const Divider(),
              ValueListenableBuilder<int>(
                valueListenable: radioNotifier,
                builder: (context, value, child) {
                  return RadioListTile.adaptive(
                      value: 1,
                      groupValue: value,
                      onChanged: (value) {
                        radioNotifier.value = value as int;
                        Preferences.gender = radioNotifier.value;
                      },
                      title: const Text('Masculino'));
                },
              ),
              const Divider(),
              ValueListenableBuilder<int>(
                valueListenable: radioNotifier,
                builder: (context, value, child) {
                  return RadioListTile.adaptive(
                      value: 2,
                      groupValue: value,
                      onChanged: (value) {
                        radioNotifier.value = value as int;
                        Preferences.gender = radioNotifier.value;
                      },
                      title: const Text('Femenino'));
                },
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: ValueListenableBuilder<String>(
                  valueListenable: textNotifier,
                  builder: (context, value, child) {
                    return TextFormField(
                      initialValue: value,
                      onChanged: (value) {
                        textNotifier.value = value;
                        Preferences.name = value;
                      },
                      decoration:
                          inputDecoration("Nombre", "Nombre del usuario"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
