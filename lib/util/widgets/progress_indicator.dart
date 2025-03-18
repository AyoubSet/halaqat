import 'package:flutter/material.dart';

class PIndicator extends StatelessWidget {
  const PIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(
        strokeWidth: CircularProgressIndicator.strokeAlignOutside,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
    );
  }
}
