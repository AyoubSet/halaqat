import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_view/checkbox_p.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_date_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_phone_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_text_field.dart';
import 'package:halaqat/util/constants/colors.dart';

class StudentForm extends StatefulWidget {
  final double height;
  final double width;
  const StudentForm({super.key, required this.height, required this.width});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(top: 50, left: 15, right: 15),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormTextField(
                  maxWidth: 150,
                  label: "First name",
                ),
                FormTextField(
                  maxWidth: 150,
                  label: "Last name",
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormTextField(
              maxWidth: 312.6,
              label: "Year",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormDateField(
                label: "Date of birth",
                controller: TextEditingController(),
                width: 312.6,
                height: 50),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormTextField(
              maxWidth: 312.6,
              label: "Place of birth",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormTextField(
              maxWidth: 312.6,
              label: "Address",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FormTextField(
                  maxWidth: 100,
                  label: "Parent name",
                ),
                FormPhoneField(
                    width: 200,
                    label: "Phone Number",
                    phone: TextEditingController())
              ],
            ),
            CheckboxP(label: 'Has Payed'),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: TextStyle(color: mainColor2),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
