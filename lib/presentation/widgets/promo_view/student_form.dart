import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/student_form_state.dart';
import 'package:halaqat/presentation/widgets/promo_view/checkbox_p.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_date_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_phone_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_text_field.dart';
import 'package:halaqat/util/constants/colors.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:halaqat/util/show_a_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StudentForm extends StatefulWidget {
  final double height;
  final double width;
  const StudentForm({super.key, required this.height, required this.width});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  late final TextEditingController fn;
  late final TextEditingController ln;
  late final TextEditingController year;
  late final TextEditingController dob;
  late final TextEditingController pob;
  late final TextEditingController address;
  late final TextEditingController parentName;
  late final TextEditingController parentPhoneNumber;


  @override
  void initState() {
    fn = TextEditingController();
    ln = TextEditingController();
    year = TextEditingController();
    dob = TextEditingController();
    pob = TextEditingController();
    address = TextEditingController();
    parentName = TextEditingController();
    parentPhoneNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    ln.dispose();
    fn.dispose();
    year.dispose();
    dob.dispose();
    pob.dispose();
    address.dispose();
    parentName.dispose();
    parentPhoneNumber.dispose();

    super.dispose();
  }

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
                  tag: "fn",
                  controller: fn,
                  maxWidth: 150,
                  label: "First name",
                ),
                FormTextField(
                  tag: "ln",
                  controller: ln,
                  maxWidth: 150,
                  label: "Last name",
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormTextField(
              tag: "year",
              controller: year,
              maxWidth: 312.6,
              label: "Year",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormDateField(
                label: "Date of birth",
                controller: dob,
                width: 312.6,
                height: 50),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormTextField(
              tag: "pob",
              controller: pob,
              maxWidth: 312.6,
              label: "Place of birth",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FormTextField(
              tag: "address",
              controller: address,
              maxWidth: 312.6,
              label: "Address",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FormTextField(
                  tag: "parentName",
                  controller: parentName,
                  maxWidth: 100,
                  label: "Parent name",
                ),
                FormPhoneField(
                    width: 200, label: "Phone Number", phone: parentPhoneNumber)
              ],
            ),
            CheckboxP(label: 'Has Payed'),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {
                        try {
                          if (fn.text.isEmpty || ln.text.isEmpty) {
                            throw Exception();
                          }
                          if (dob.text.isNotEmpty) {
                            DateFormat().parseStrict(dob.text);
                          }
                          final student =
                              context.read<StudentFormState>().union();
                          context.read<StudentFormState>().reset();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(promo, (route) => false);
                        } on FormatException {
                          showADialog(context,
                              title: "Malformated date",
                              content:
                                  "Please verify the format of the date of birth",
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"))
                              ]);
                        } on Exception {
                          showADialog(context,
                              title: "Not named student",
                              content: "One of the name fields are empty",
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"))
                              ]);
                        }
                      },
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
