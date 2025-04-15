import 'package:flutter/material.dart';
import 'package:halaqat/business/entity/student_info.dart';
import 'package:halaqat/util/constants/DB/student_info_db.dart';

class StudentFormState extends ChangeNotifier {
  String firstName = "";
  String lastName = "";
  String year = "";
  String dateOfBirth = "";
  String placeOfBirth = "";
  String address = "";
  String parentName = "";
  String parentPhoneNumber = "";
  bool? hasPayed;
  StudentFormState();
  void updateFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void updateYear(String value) {
    year = value;
    notifyListeners();
  }

  void updateDateOfBirth(String value) {
    dateOfBirth = value;
    notifyListeners();
  }

  void updatePlaceOfBirth(String value) {
    placeOfBirth = value;
    notifyListeners();
  }

  void updateAddress(String value) {
    address = value;
    notifyListeners();
  }

  void updateParentName(String value) {
    parentName = value;
    notifyListeners();
  }

  void updateParentPhoneNumber(String value) {
    parentPhoneNumber = value;
    notifyListeners();
  }

  void updateHasPayed(bool value) {
    hasPayed = value;
    notifyListeners();
  }

  void reset() {
    firstName = "";
    lastName = "";
    year = "";
    dateOfBirth = "";
    placeOfBirth = "";
    address = "";
    parentName = "";
    parentPhoneNumber = "";
    hasPayed;
  }

  void getInfoFromField(String tag, String value) {
    switch (tag) {
      case "fn":
        updateFirstName(value);
        break;
      case "ln":
        updateLastName(value);
        break;
      case "year":
        updateYear(value);
        break;
      case "pob":
        updatePlaceOfBirth(value);
        break;
      case "address":
        updateAddress(value);
        break;
      case "parentName":
        updateParentName(value);
        break;
      default:
    }
  }

  StudentInformation union(){
    return StudentInformation(firstName, lastName, year, dateOfBirth, placeOfBirth, address, parentName, parentPhoneNumber, hasPayed ?? false);
  }

}
