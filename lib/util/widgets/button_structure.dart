import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_selection/functions/add_button_onpressed.dart';
import 'package:halaqat/util/constants/colors.dart';

class ButtonStructure extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const ButtonStructure({super.key, required this.margin});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenWidth * 0.13,
        width: screenWidth * 0.13,
        margin: margin,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 1.0,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                iconColor: mainColor,
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