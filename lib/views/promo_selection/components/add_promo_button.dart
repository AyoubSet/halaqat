import 'package:flutter/material.dart';

class AddPromoButton extends StatelessWidget {
  const AddPromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Tooltip(
      textAlign: TextAlign.center,
      decoration: BoxDecoration(
          color: Color.fromRGBO(99, 104, 97, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      message: "Add Promo",
      margin: EdgeInsets.only(bottom: 15),
      waitDuration: Duration(microseconds: 200),
      exitDuration: Duration(microseconds: 200),
      child: Container(
        height: screenWidth * 0.13,
        width: screenWidth * 0.13,
        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 1.0,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                iconColor: const Color.fromARGB(255, 18, 50, 11),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Center(
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
