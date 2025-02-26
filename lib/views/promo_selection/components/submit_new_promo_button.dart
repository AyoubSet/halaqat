import 'package:halaqat/util/constants/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:halaqat/entity/promo.dart';
import 'package:halaqat/services/promo_service.dart';
import 'package:halaqat/state/form_state.dart';
import 'package:halaqat/util/show_error_dialog.dart';


class SubmitNewPromoButton extends StatelessWidget {
  const SubmitNewPromoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          String name = context.read<PromoFormState>().name;
          String description = context.read<PromoFormState>().description;
          if (name == '') {
            showErrorDialog(context);
          } else {
            PromoService().promos.add(Promo(
                  namePromo: name,
                  descriptionPromo: description,
                ));
            context.read<PromoFormState>().reset();
                Navigator.pop(context);
          }
        },
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
