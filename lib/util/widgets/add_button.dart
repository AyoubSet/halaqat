import 'package:flutter/material.dart';
import 'package:halaqat/util/widgets/button_structure.dart';
class AddButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String message;
  const AddButton({super.key, required this.margin, required this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      textAlign: TextAlign.center,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(99, 104, 97, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      message: message,
      margin: const EdgeInsets.only(bottom: 15),
      waitDuration: const Duration(microseconds: 200),
      exitDuration: const Duration(microseconds: 200),
      child: ButtonStructure(margin: margin)
    );
  }
}
