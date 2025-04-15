import 'package:flutter/material.dart';
import 'package:halaqat/util/widgets/square_iconed_button.dart';

class HalaqatPage extends StatefulWidget {
  const HalaqatPage({super.key});

  @override
  State<HalaqatPage> createState() => _HalaqatPageState();
}

class _HalaqatPageState extends State<HalaqatPage> {
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
            "No Halqat Found",
            style: TextStyle(color: Colors.white),
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: SquareIconedButton(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              message: "Add Student",
              onPress: () {}, child: Icon(Icons.add),
            ),
          ),
        ])),
      ),
    );
  }
}
