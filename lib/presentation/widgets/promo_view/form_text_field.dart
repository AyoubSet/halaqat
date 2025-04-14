import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormTextField extends TextField {
  final double maxWidth;
  final double maxHeight;
  EdgeInsets? margin;
  FormTextField(
      {super.key,
      this.margin,
      required this.maxWidth,
      required this.maxHeight});

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            constraints: BoxConstraints(
                maxHeight: widget.maxHeight, maxWidth: widget.maxWidth),
            fillColor: Colors.white),
      ),
    );
  }
}
