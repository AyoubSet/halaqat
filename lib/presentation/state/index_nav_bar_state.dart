import 'package:flutter/material.dart';

class IndexNavBarState extends ChangeNotifier {
  int index = 2;
  void updateIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}