import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  const FormTextField(
      {super.key, required this.maxWidth, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(11, 5, 11, 5),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            constraints:
                BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
            fillColor: Colors.white),
      ),
    );
  }
}
