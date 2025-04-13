import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:halaqat/util/widgets/square_iconed_button.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * 0.82,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(
            child: Stack(children: [
          Center(
              child: Text(
            "No Student Found",
            style: TextStyle(color: Colors.white),
          )),
          Align(
            alignment: Alignment.bottomRight,
            //TODO: Add custom onPress
            child: SquareIconedButton(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              message: "Add Student",
              onPress: () => pushForm(context),
              child: Icon(Icons.add),
            ),
          ),
        ])),
      ),
    );
  }
}

void pushForm(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, studentForm, (route) => false);
}
