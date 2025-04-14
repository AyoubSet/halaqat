import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_date_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_phone_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_text_field.dart';
import 'package:halaqat/util/widgets/bg.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Bg(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormTextField(
                        maxHeight: 40,
                        maxWidth: 150,
                        margin: EdgeInsets.fromLTRB(4, 4, 12, 4),
                      ),
                      FormTextField(
                        maxHeight: 40,
                        maxWidth: 150,
                        margin: EdgeInsets.fromLTRB(12, 4, 4, 4),
                      ),
                    ],
                  ),
                  FormTextField(
                    maxHeight: 40,
                    maxWidth: 325,
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  ),
                  FormDateField(
                    controller: _dateController,
                    label: "Enter Date of Birth",
                    width: 325,
                    height: 40,
                  ),
                  FormTextField(
                    maxHeight: 40,
                    maxWidth: 325,
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  ),
                  FormTextField(
                    maxHeight: 40,
                    maxWidth: 325,
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  ),
                  FormTextField(
                    maxHeight: 40,
                    maxWidth: 325,
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: FormPhoneField(
                              height: 40,
                              width: 225,
                              phone: TextEditingController()),
                        ),
                      ),
                      Checkbox(
                          value: false,
                          tristate: false,
                          onChanged: (value) {
                            setState(() {
                              value = !value!;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
