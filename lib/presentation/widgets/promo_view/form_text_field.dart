import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/student_form_state.dart';
import 'package:halaqat/presentation/widgets/promo_view/field_decoration.dart';
import 'package:halaqat/util/constants/colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FormTextField extends StatefulWidget {
  final double maxWidth;
  double? maxHeight = 50;
  EdgeInsets? margin;
  final String label;
  final TextEditingController controller;
  final String tag;
  FormTextField({
    super.key,
    this.margin,
    required this.maxWidth,
    this.maxHeight,
    required this.label,
    required this.controller,
    required this.tag,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
          onChanged: (value) {
            context
                .read<StudentFormState>()
                .getInfoFromField(widget.tag, value);
          },
          cursorColor: mainColor2,
          controller: widget.controller,
          decoration: customInputDecoration(
            label: widget.label,
            c: BoxConstraints(
                maxHeight: widget.maxHeight ?? 50, maxWidth: widget.maxWidth),
          )),
    );
  }
}
