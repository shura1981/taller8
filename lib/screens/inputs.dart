import 'package:flutter/material.dart';
import 'package:taller8/utils/helpers.dart';

class InputScreen extends StatelessWidget {
  static String name = 'InputScreen';
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(30)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('InputScreen'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder: (context, constrainst) {
            double maxWidth = getMaxWidth(context)-16;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 225, 225, 225)),
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text('Prueba Inputs'),
                        const SizedBox(height: 40),
                        const TextField(
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          maxLength: 20,
                          decoration: InputDecoration(
                              hintText: 'escribe un nombre',
                              iconColor: Colors.red,
                              enabledBorder: border,
                              focusColor: Colors.red,
                              focusedBorder: border.copyWith(
                                  borderSide:
                                      const BorderSide(color: Colors.blueAccent))),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.previous ,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(height: 40),
                        const TextField()
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
