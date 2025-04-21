// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/data_source/student_service.dart';
import 'package:halaqat/util/show_a_dialog.dart';

class ListTileOfStudent extends StatefulWidget {
  final String fn;
  final String ln;
  final int index;
  const ListTileOfStudent(
      {super.key, required this.index, required this.fn, required this.ln});

  @override
  // ignore: no_logic_in_create_state
  State<ListTileOfStudent> createState() => _ListTileOfStudentState();
}

class _ListTileOfStudentState extends State<ListTileOfStudent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white.withOpacity(0.85),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListTile(
          trailing: IconButton(
              onPressed: () {
                showADialog(context,
                    title: "Delete student",
                    content:
                        "Are You Sure to delete ${widget.fn} ${widget.ln}?",
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () async {
                            await StudentService().deleteStudent(
                                fn: widget.fn,
                                ln: widget.ln,
                                promoId: PromoService().currentPromo!.id);
                            Navigator.pop(context);
                          },
                          child: Text("Delete"))
                    ]);
              },
              icon: Icon(Icons.delete,color: Colors.red.withOpacity(0.85),)),
          title: Text("${widget.fn} ${widget.ln}"),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
