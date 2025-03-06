import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/models/promo_db.dart';
import 'package:halaqat/util/show_a_dialog.dart';

class ListTileOfPromo extends StatefulWidget {
  final String title;
  final String subtitle;
  final int index;
  const ListTileOfPromo(
      {super.key, required this.title, required this.subtitle, required this.index});

  @override
  State<ListTileOfPromo> createState() => _ListTileOfPromoState();
}

class _ListTileOfPromoState extends State<ListTileOfPromo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
                      await PromoService().deletePromo(id: (await PromoService().getPromoByName(name: widget.title)).id);
                      Future.microtask(() {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      });
                    },
                    child: Text('Delete')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'))
              ],
            );
          },
          icon: Icon(Icons.delete),
        ),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0)),
        subtitleTextStyle: TextStyle(
          color: Color.fromRGBO(146, 146, 146, 1),
        ),
      ),
    );
  }
}
