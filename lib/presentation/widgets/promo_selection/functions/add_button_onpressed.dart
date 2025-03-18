import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_selection/desciprion_field.dart';
import 'package:halaqat/presentation/widgets/promo_selection/drag_handle.dart';
import 'package:halaqat/presentation/widgets/promo_selection/name_field.dart';
import 'package:halaqat/presentation/widgets/promo_selection/submit_new_promo_button.dart';
import 'package:halaqat/util/widgets/bg.dart';

void addButtonOnPressed(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    elevation: 1,
    context: context,
    // backgroundColor: Colors.white,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DragHandle(),
            Stack(
              children: [
                SizedBox(
                  height: 252,
                  child: Bg(),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      NameField(),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      DesciprionField(),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      SubmitNewPromoButton(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
