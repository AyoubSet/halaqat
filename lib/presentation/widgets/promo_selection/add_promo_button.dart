import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_selection/button_structure.dart';
class AddPromoButton extends StatelessWidget {
  const AddPromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      textAlign: TextAlign.center,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(99, 104, 97, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      message: "Add Promo",
      margin: const EdgeInsets.only(bottom: 15),
      waitDuration: const Duration(microseconds: 200),
      exitDuration: const Duration(microseconds: 200),
      child: const ButtonStructure()
    );
  }
}
