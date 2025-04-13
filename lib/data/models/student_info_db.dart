import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/DB/student_info_db.dart';

@immutable
class DataBaseStudentInformation {
  //* Attributes
  final int id;
  final int promoId;
  final String fn;
  final String ln;
  final String year;
  final String dob;
  final String pob;
  final String address;
  final String parentName;
  final String parentPhoneNumber;
  final bool payment;

  //*Constructer
  const DataBaseStudentInformation({
    required this.promoId,
    required this.id,
    required this.fn,
    required this.ln,
    required this.year,
    required this.dob,
    required this.pob,
    required this.address,
    required this.parentName,
    required this.parentPhoneNumber,
    required this.payment,
  });

  DataBaseStudentInformation.fromRow(Map<String, Object?> map)
    : id = map[StudentInfoDb.idColumm] as int,
      promoId = map[StudentInfoDb.promoIDColumm] as int,
      fn = map[StudentInfoDb.fnColumm] as String,
      ln = map[StudentInfoDb.lnColumm] as String,
      year = map[StudentInfoDb.yearColumm] as String,
      dob = map[StudentInfoDb.dobColumm] as String,
      pob = map[StudentInfoDb.pobColumm] as String,
      address = map[StudentInfoDb.addressColumm] as String,
      parentName = map[StudentInfoDb.parentnameColumm] as String,
      parentPhoneNumber = map[StudentInfoDb.parentphonenumberColumm] as String,
      payment = map[StudentInfoDb.payementColumm] as int == 0 ? true : false;
  
  //*Overrides
  @override
  String toString() => "ID-Name = $id:$fn $ln";
  @override
  bool operator ==(covariant DataBaseStudentInformation other) {
    return id == other.id;
  }
  @override
  int get hashCode => id.hashCode;
}
