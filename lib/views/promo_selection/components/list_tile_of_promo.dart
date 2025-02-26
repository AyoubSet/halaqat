import 'package:flutter/material.dart';

class ListTileOfPromo extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function onPressed;
  final int index;
  const ListTileOfPromo({super.key, required this.title, this.subtitle, required this.onPressed, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.85),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle ?? ''),
        trailing: IconButton(
          onPressed: () {
            onPressed(index);
          },
          icon: Icon(Icons.delete),
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0)
        ),
        subtitleTextStyle: TextStyle(
          color: Color.fromRGBO(146, 146, 146, 1),
        ),
      ),
    );
  }
}
