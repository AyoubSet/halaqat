import 'package:flutter/material.dart';

class PromoFormState extends ChangeNotifier {
  String name = '';
  String description = '';
  PromoFormState();
  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateDescription(String newDescription) {
    description = newDescription;
    notifyListeners();
  }

  void reset({bool notify = true}) {
    name = '';
    description = '';
    if (notify) notifyListeners();
  }
}
