// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/local/shared_prefs_service.dart';
import 'package:halaqat/util/constants/colors.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:halaqat/util/show_a_dialog.dart';

class ListTileOfPromo extends StatefulWidget {
  final String title;
  final String subtitle;
  final int index;
  const ListTileOfPromo(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.index});

  @override
  // ignore: no_logic_in_create_state
  State<ListTileOfPromo> createState() => _ListTileOfPromoState(title: title);
}

class _ListTileOfPromoState extends State<ListTileOfPromo> {
  final String title;
  _ListTileOfPromoState({required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        PromoService().currentPromo =
            await PromoService().getPromoByName(name: title);
        await SharedPrefsService()
            .saveSelectedPromo(PromoService().currentPromo!.id);
        Future.delayed(Duration(microseconds: 10));
        Navigator.popAndPushNamed(context, promo);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white.withOpacity(0.85),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          trailing: IconButton(
            onPressed: () {
              showADialog(
                context,
                title: 'Delete Promo',
                content: 'Are You Sure You Want To Delete This Promo',
                actions: [
                  TextButton(
                      onPressed: () async {
                        final deletedPromoName = widget.title;
                        await PromoService().deletePromo(
                            id: (await PromoService()
                                    .getPromoByName(name: deletedPromoName))
                                .id);
                        Future.microtask(() {
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            elevation: 0,
                            dismissDirection: DismissDirection.down,
                            duration: Duration(seconds: 1),
                            content:
                                Text("$deletedPromoName promo is deleted")));
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: mainColor),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel',
                          style: TextStyle(color: mainColor)))
                ],
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red.withOpacity(0.8),
            ),
          ),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0)),
          subtitleTextStyle: TextStyle(
            color: Color.fromRGBO(146, 146, 146, 1),
          ),
        ),
      ),
    );
  }
}
