import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_selection/add_promo_button.dart';

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
        child: AddPromoButton(),
      ),
    ]);
  }
}
