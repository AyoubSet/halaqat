import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_view/field_decoration.dart';

// ignore: must_be_immutable
class FormTextField extends TextField {
  final double maxWidth;
  double? maxHeight = 50;
  EdgeInsets? margin;
  final String label;
  FormTextField({
    super.key,
    this.margin,
    required this.maxWidth,
    this.maxHeight,
    required this.label,
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
          decoration: customInputDecoration(
        label: widget.label,
        c: BoxConstraints(
            maxHeight: widget.maxHeight ?? 50, maxWidth: widget.maxWidth),
      )),
    );
  }
}
