import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/student_form_state.dart';
import 'package:halaqat/util/constants/colors.dart';
import 'package:provider/provider.dart';

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
              context.read<StudentFormState>().updateHasPayed(isChecked);
            }),
        Text(widget.label)
      ],
    );
  }
}
