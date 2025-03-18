import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Center(
        child: Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: const BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
