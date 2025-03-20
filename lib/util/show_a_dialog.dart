import 'package:flutter/material.dart';

Future<void> showADialog(BuildContext context ,{required String title , required String content , required List<Widget> actions}) async{
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.warning_amber_outlined),
          iconColor: Colors.red,
          titlePadding: EdgeInsets.all(0),
          iconPadding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          title: Text(title),
          content: Text(content),
          actions: actions
        );
      });
}