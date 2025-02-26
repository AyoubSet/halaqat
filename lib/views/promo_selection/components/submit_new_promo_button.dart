import 'package:flutter/material.dart';

class SubmitNewPromoButton extends StatelessWidget {
  const SubmitNewPromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Submit",
          style: TextStyle(
            color: Color.fromARGB(255, 62, 92, 58),
          ),
        ),
      ),
    );
  }
}
