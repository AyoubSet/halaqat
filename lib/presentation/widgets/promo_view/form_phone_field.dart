import 'package:flutter/material.dart';

class FormPhoneField extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController phone;
  const FormPhoneField({super.key, required this.height, required this.width, required this.phone});

  @override
  State<FormPhoneField> createState() => _FormPhoneFieldState();
}

class _FormPhoneFieldState extends State<FormPhoneField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: widget.height,
          maxWidth: widget.width
        ),
        filled: true,
        fillColor: Colors.white
      ),
      controller: widget.phone,
      keyboardType: TextInputType.phone,
    );
  }
}