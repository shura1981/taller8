import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Button({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).colorScheme.primary,
      disabledColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      elevation: 0,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
