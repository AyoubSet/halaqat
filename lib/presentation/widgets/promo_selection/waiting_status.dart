import 'package:flutter/material.dart';
import 'package:halaqat/util/widgets/add_button.dart';

class WaitingStatus extends StatelessWidget {
  const WaitingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: Text(
        'Loading Promos...',
        style: TextStyle(color: Colors.white),
      )),
      Align(
        alignment: Alignment.bottomRight,
        child: AddButton(
          margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
          message: "Add Promo",
        ),
      ),
    ]);
  }
}
