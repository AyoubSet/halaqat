import 'package:flutter/material.dart';

Future<void> showADialog(BuildContext context ,{required String title , required String content , required List<Widget> actions}) async{
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions
        );
      });
}

//[
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Ok'))
//           ],