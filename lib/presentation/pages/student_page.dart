import 'package:flutter/material.dart';
import 'package:halaqat/util/widgets/add_button.dart';

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
            child: AddButton(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              message: "Add Student",
            ),
          ),
        ])),
      ),
    );
  }
}
