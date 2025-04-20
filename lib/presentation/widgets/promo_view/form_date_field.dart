import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/student_form_state.dart';
import 'package:halaqat/presentation/widgets/promo_view/field_decoration.dart';
import 'package:halaqat/util/constants/colors.dart';
import 'package:halaqat/util/show_a_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FormDateField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final double width;
  double? height;
  FormDateField(
      {super.key,
      required this.label,
      required this.controller,
      required this.width,
      this.height});

  @override
  State<FormDateField> createState() => _FormDateFieldState();
}

class _FormDateFieldState extends State<FormDateField> {
  @override
  Widget build(BuildContext context) {
    MaskTextInputFormatter mask = MaskTextInputFormatter(
        mask: "####-##-##", filter: {"#": RegExp(r"[0-9]")});
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (value) {
          try {
            DateFormat('yyyy-MM-dd').parseStrict(value);
          } catch (_) {
            showADialog(context,
                title: "MalFormated Date",
                content: "Enter a valid date",
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ]);
            widget.controller.clear();
          }
        },
        inputFormatters: [mask],
        cursorColor: mainColor2,
        decoration: customInputDecoration(
          hint: "YYYY-MM-DD",
          label: widget.label,
          c: BoxConstraints(
              maxHeight: widget.height ?? 50, maxWidth: widget.width),
        ),
        onChanged: (value) {
          context.read<StudentFormState>().updateDateOfBirth(value);
        },
      ),
    );
  }
}
