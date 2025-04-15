import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/colors.dart';

class CheckboxP extends StatefulWidget {
  final String label;
  const CheckboxP({super.key, required this.label});

  @override
  State<CheckboxP> createState() => _CheckboxPState();
}

class _CheckboxPState extends State<CheckboxP> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: mainColor2,
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            }),
        Text(widget.label)
      ],
    );
  }
}
