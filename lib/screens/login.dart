import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller8/models/response_login.dart';
import 'package:taller8/screens/home.dart';
import 'package:taller8/services/authentication_service.dart';
import 'package:taller8/share_preferences/preferences.dart';
import 'package:taller8/utils/helpers.dart';

import '../providers/login.dart';

class LoginScreen extends StatelessWidget {
  static String name = 'LoginScreen';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(builder: (context, constraints) {
          double maxWidth = getMaxWidth(context);
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<LoginModel>(builder: (context, model, child) {
                    return TextField(
                      onChanged: (value) {
                        model.setEmail(value);
                      },
                      onSubmitted: (value) {
                        model.setEmail(value);
                      },
                      controller: TextEditingController(text: model.email)
                        ..selection =
                            TextSelection.collapsed(offset: model.email.length),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Correo',
                          prefixIcon: const Icon(Icons.email),
                          suffixIcon: IconButton(
                              onPressed: () {
                                model.setEmail('');
                              },
                              icon: Icon(model.email.isNotEmpty
                                  ? Icons.close
                                  : null))),
                    );
                  }),
                  const SizedBox(height: 20),
                  Consumer<LoginModel>(builder: (_, model, __) {
                    return TextField(
                      onChanged: (value) {
                        context.read<LoginModel>().setPassword(value);
                      },
                      onSubmitted: (value) {
                        context.read<LoginModel>().setPassword(value);
                      },
                      obscureText: model.isObscure,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock),
                          errorText: !model.isValidPassword()
                              ? 'La contraseña es requerida: ${model.isValidPassword()}'
                              : null,
                          suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<LoginModel>()
                                    .togglePasswordVisibility();
                              },
                              icon: Icon(model.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    );
                  }),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 20),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                      ),
                    ),
                    onPressed: () async {
                      final provider =
                          Provider.of<LoginModel>(context, listen: false);
                        bool validatePass=   provider.validatePassWord(provider.password);
                        provider.setIsValidPassword(validatePass);

                      try {
                        showLoadingDialog(context);
                        ResponseLogin? loginResponse =
                            await ApiService.loginUser(
                                context.read<LoginModel>().email,
                                context.read<LoginModel>().password);
                        final token = loginResponse.data.jsontoken;
                        Preferences.setJwtLogin(token).then((value) {
                          Navigator.pushReplacementNamed(
                              context, MyHomePage.name);
                        });
                      } on Exception catch (e) {
                        mostrarError(context, ApiService.handleError(e));
                      } finally {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
