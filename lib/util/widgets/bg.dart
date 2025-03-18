import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  const Bg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 3, 36, 25),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.1, 
            child: Image.asset(
              'assets/bgpattern.png', 
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
