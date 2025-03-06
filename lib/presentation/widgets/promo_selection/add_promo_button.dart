import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_selection/desciprion_field.dart';
import 'package:halaqat/presentation/widgets/promo_selection/drag_handle.dart';
import 'package:halaqat/presentation/widgets/promo_selection/name_field.dart';
import 'package:halaqat/presentation/widgets/promo_selection/submit_new_promo_button.dart';
/*   DataBasePromo? _promo;
  late final PromoService _promoService;
*/


// ignore: must_be_immutable
class AddPromoButton extends StatelessWidget {

  const AddPromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Tooltip(
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
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    elevation: 1,
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DragHandle(),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 62, 92, 58),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NameField(),
                                  SizedBox(height: 10),
                                  DesciprionField(),
                                  SizedBox(height: 20),
                                  SubmitNewPromoButton()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Center(
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
