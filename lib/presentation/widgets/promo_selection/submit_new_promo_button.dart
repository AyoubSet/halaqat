// ignore_for_file: use_build_context_synchronously

import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/util/constants/colors.dart';
import 'package:halaqat/util/exceptions/crud_exceptions.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/form_state.dart';
import 'package:halaqat/util/show_a_dialog.dart';

class SubmitNewPromoButton extends StatefulWidget {
  const SubmitNewPromoButton({
    super.key,
  });

  @override
  State<SubmitNewPromoButton> createState() => _SubmitNewPromoButtonState();
}

class _SubmitNewPromoButtonState extends State<SubmitNewPromoButton> {
  late final PromoService _promoService;
  late PromoFormState state;
  @override
  void initState() {
    _promoService = PromoService();
    state = context.read<PromoFormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          String name = context.read<PromoFormState>().name;
          String description = context.read<PromoFormState>().description;
          if (name == '') {
            await showADialog(
              context,
              title: 'Empty Name',
              content: 'Please enter a valid name',
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Ok",
                      style: TextStyle(color: mainColor),
                    ))
              ],
            );
          } else {
            try {
              await _promoService.createPromo(
                  name: name, description: description);
            } on PromoAlreadyExistsException {
              showADialog(context,
                  title: "Promo Already Exists",
                  content: "You have a promo with this name,try to change it",
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(color: mainColor),
                        )),
                  ]);
            } finally {
              Future.microtask(() {
                if (context.mounted) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      state.reset(notify: true);
                    }
                  });
                }
              });
            }
          }
        },
        child: Text(
          "Submit",
          style: TextStyle(
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
