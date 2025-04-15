import 'package:flutter/material.dart';

@immutable
class StudentInformation {
  //* Attributes
  final String fn;
  final String ln;
  final String _year;
  final String dob;
  final String pob;
  final String _address;
  final String _parentName;
  final String _parentPhoneNumber;
  final bool _payment;

  //*Constructer
  const StudentInformation(
    this.fn,
    this.ln,
    this._year,
    this.dob,
    this.pob,
    this._address,
    this._parentName,
    this._parentPhoneNumber,
    this._payment,
  );
  String get firstName => fn;
  String get lastName => ln;
  String get year => _year;
  String get dateOfBirth => dob;
  String get placeOfBirth => pob;
  String get address => _address;
  String get parentName => _parentName;
  String get parentPhoneNumber => _parentPhoneNumber;
  bool get payment => _payment;

  @override
  String toString() {
    return 'StudentInformation('
        'firstName: $fn, '
        'lastName: $ln, '
        'year: $_year, '
        'dateOfBirth: $dob, '
        'placeOfBirth: $pob, '
        'address: $_address, '
        'parentName: $_parentName, '
        'parentPhoneNumber: $_parentPhoneNumber, '
        'payment: $_payment'
        ')';
  }
}
