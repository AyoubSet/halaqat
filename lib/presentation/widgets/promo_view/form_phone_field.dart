import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_view/field_decoration.dart';

class FormPhoneField extends StatefulWidget {
  double? height;
  final double width;
  final String label;
  final TextEditingController phone;
  FormPhoneField({super.key, this.height, required this.width, required this.label, required this.phone});

  @override
  State<FormPhoneField> createState() => _FormPhoneFieldState();
}

class _FormPhoneFieldState extends State<FormPhoneField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: customInputDecoration(label: widget.label,c: BoxConstraints(
          maxHeight: widget.height ?? 50,
           maxWidth: widget.width
       ),),
      // InputDecoration(
      //   constraints: BoxConstraints(
      //     maxHeight: widget.height ?? 50,
      //     maxWidth: widget.width
      //   ),
      //   filled: true,
      //   fillColor: Colors.white.withOpacity(0.75),
      //   labelText: widget.label
      // ),
      controller: widget.phone,
      keyboardType: TextInputType.phone,
    );
  }
}