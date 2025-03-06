import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/form_state.dart';
import 'package:halaqat/util/show_a_dialog.dart';

//! dont need a fix
//TODO : Add comments here

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
                    child: Text('Ok'))
              ],
            );
          } else {
            await _promoService.createPromo(
                name: name, description: description);
            Future.microtask(() {
              if (context.mounted) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    state.reset(notify: true);
                  }
                });
                Navigator.of(context).pop();
              }
            });
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
