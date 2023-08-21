import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller8/models/response_login.dart';
import 'package:taller8/screens/home.dart';
import 'package:taller8/services/authentication_service.dart';
import 'package:taller8/share_preferences/preferences.dart';
import 'package:taller8/styles/input_decoration.dart';
import 'package:taller8/utils/helpers.dart';
import 'package:taller8/widgets/widget.dart';

import '../providers/login.dart';

class LoginScreen extends StatelessWidget {
  static String name = 'LoginScreen';
  final formKey = GlobalKey<FormState>();
  final space = 30.0;
  LoginScreen({super.key});

  Future<void> onPressed(BuildContext context) async {
    //0cultar teclado
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    try {
      showLoadingDialog(context);
      ResponseLogin? loginResponse = await ApiService.loginUser(
          context.read<LoginModel>().email,
          context.read<LoginModel>().password);
      final token = loginResponse.data.jsontoken;
      Preferences.setJwtLogin(token).then((value) {
        Navigator.pushReplacementNamed(context, MyHomePage.name);
      });
    } on Exception catch (e) {
      mostrarError(context, ApiService.handleError(e));
    } finally {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      body: Stack(
        children: [
          const FondoLogo(),
          LayoutBuilder(builder: (context, constraints) {
            double maxWidth = getMaxWidth(context);
            return Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: maxWidth - 40),
                child: Card(
                  elevation: 10,
                  shadowColor: const Color.fromARGB(100, 51, 51, 51),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Ingreso',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 30,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: space),
                          Consumer<LoginModel>(
                              builder: (context, model, child) {
                            return TextFormField(
                              onChanged: (value) {
                                model.setEmail(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'El correo no puede estar vacío';
                                }
                                if (!model.validateEmail()) {
                                  return 'El correo no es válido';
                                }
                                return null;
                              },
                              controller:
                                  TextEditingController(text: model.email)
                                    ..selection = TextSelection.collapsed(
                                        offset: model.email.length),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration:
                                  InputDecorationApp.inputDecoratiooLogin(
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
                            return TextFormField(
                              onFieldSubmitted: (_) => onPressed(context),
                              onSaved: (value) {
                                context.read<LoginModel>().setPassword(value!);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'La contraseña no puede estar vacía';
                                }
                                if (!model.validatePassWord(value)) {
                                  return 'La contraseña debe tener al menos 5 caracteres y un \ncarácter especial';
                                }
                                return null;
                              },
                              obscureText: model.isObscure,
                              decoration:
                                  InputDecorationApp.inputDecoratiooLogin(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Contraseña',
                                      prefixIcon: const Icon(Icons.lock),
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
                          SizedBox(height: space),
                          // ButtonElevated( onPressed: () => onPressed(context),formKey: formKey),
                          Button(
                            onPressed: () => onPressed(context),
                            text: 'Ingresar',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    super.key,
    required this.formKey,
    this.onPressed,
  });
  final void Function()? onPressed;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 20),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ),
      onPressed: onPressed,
      child: const Text('Iniciar sesión'),
    );
  }
}
