import 'package:flutter/material.dart';

class FormDateField extends StatelessWidget {
  const FormDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DatePickerDialog(firstDate: DateTime(2000), lastDate: DateTime.now()),
    );
  }
}