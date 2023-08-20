import 'package:flutter/material.dart';

class FondoLogo extends StatelessWidget {
  const FondoLogo({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screenHeigth * 0.4,
            width: double.infinity,
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                     Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Stack(
              children: [
                SafeArea(
                    child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: const Icon(
                    Icons.person_pin,
                    color: Colors.white,
                    size: 100,
                  ),
                )),
                Positioned(top: 90, left: 30, child: _Bubble()),
                Positioned(top: -40, left: -30, child: _Bubble()),
                Positioned(top: -50, right: -20, child: _Bubble()),
                Positioned(bottom: -50, left: 10, child: _Bubble()),
                Positioned(bottom: 120, right: 20, child: _Bubble()),
              ],
            ),
          ),
          Container(
            height: screenHeigth * 0.6,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}
