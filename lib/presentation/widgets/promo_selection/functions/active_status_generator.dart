import 'package:flutter/material.dart';
import 'package:halaqat/data/models/promo_db.dart';
import 'package:halaqat/presentation/widgets/promo_selection/functions/add_promo.dart';
import 'package:halaqat/util/widgets/square_iconed_button.dart';
import 'package:halaqat/presentation/widgets/promo_selection/list_tile_of_promo.dart';

//FIXME: Transform to a class
Widget activeStatusGenerator({
  required AsyncSnapshot snapshot,
  required double screenHeight,
  required double screenWidth,
  required BuildContext context
}) {
  final allNotes = snapshot.data as List<DataBasePromo>;
  final Widget widgetToDisplay;
  if (snapshot.hasData) {
    if (allNotes.isNotEmpty) {
      widgetToDisplay = Center(
          child: SizedBox(
        height: screenHeight * 0.7,
        width: screenWidth * 0.9,
        child: ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (context, index) {
            return ListTileOfPromo(
              title: allNotes.elementAt(index).name,
              subtitle: allNotes.elementAt(index).descrption,
              index: index,
            );
          },
        ),
      ));
    } else {
      widgetToDisplay = Center(
          child: Text(
        'No Promo found , Add new....',
        style: TextStyle(color: Colors.white),
      ));
    }
  } else {
    widgetToDisplay = Text(
      'Error!!',
      style: TextStyle(color: Colors.white),
    );
  }
  return Stack(children: [
    widgetToDisplay,
    Align(
      alignment: Alignment.bottomRight,
      child: SquareIconedButton(onPress: () => addPromo(context),
        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
        message: "Add Promo", child: Icon(Icons.add),
      ),
    ),
  ]);
}
