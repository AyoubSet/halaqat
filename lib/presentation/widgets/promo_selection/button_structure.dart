import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_selection/functions/add_button_onpressed.dart';

class ButtonStructure extends StatefulWidget {
  const ButtonStructure({super.key});

  @override
  State<ButtonStructure> createState() => _ButtonStructureState();
}

class _ButtonStructureState extends State<ButtonStructure> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenWidth * 0.13,
        width: screenWidth * 0.13,
        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 1.0,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                iconColor: const Color.fromARGB(255, 3, 36, 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                addButtonOnPressed(context);
              },
              child: const Center(
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
        ),
      );
  }
}