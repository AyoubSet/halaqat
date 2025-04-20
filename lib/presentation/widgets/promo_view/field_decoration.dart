import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/colors.dart';

InputDecoration customInputDecoration({
  required String label,
  String? hint,
  BoxConstraints? c
}) {
  return InputDecoration(
    // filled: true,
    // fillColor: Colors.white.withOpacity(0.75),
    hintText: hint,
    labelText: label,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: mainColor2, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: TextStyle(color: mainColor2,),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    constraints: c,
  );
}