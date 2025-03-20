import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/colors.dart';

class Bg extends StatelessWidget {
  const Bg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: mainColor,
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
