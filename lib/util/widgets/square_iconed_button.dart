import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/colors.dart';

class SquareIconedButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String message;
  final VoidCallback onPress;
  final Icon child;
  const SquareIconedButton(
      {super.key,
      required this.margin,
      required this.message,
      required this.onPress,
      required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Tooltip(
        textAlign: TextAlign.center,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(99, 104, 97, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        message: message,
        margin: const EdgeInsets.only(bottom: 15),
        waitDuration: const Duration(microseconds: 200),
        exitDuration: const Duration(microseconds: 200),
        child: Container(
          height: screenWidth * 0.13,
          width: screenWidth * 0.13,
          margin: margin,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  iconColor: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  onPress();
                },
                child: Center(
                  child: child
                ),
              ),
            ),
          ),
        ));
  }
}
