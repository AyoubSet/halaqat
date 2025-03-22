import 'package:flutter/foundation.dart';

class IndexNavBarState extends ChangeNotifier {
  int index = 2;
  void updateIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}