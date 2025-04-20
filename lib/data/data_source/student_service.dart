// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:halaqat/business/entity/student_info.dart';
import 'package:halaqat/data/models/student_info_db.dart';
import 'package:halaqat/util/constants/DB/db_helper.dart';
import 'package:halaqat/util/constants/DB/student_info_db.dart';
import 'package:halaqat/util/exceptions/crud_exceptions.dart';

class StudentService {
  static final StudentService _studentsService = StudentService._init();
  StudentService._init() {
    _studentStreamController =
        StreamController<List<DataBaseStudentInformation>>.broadcast(
      onListen: () {
        _studentStreamController.sink.add(_students);
      },
    );
  }
  factory StudentService() => _studentsService;

  final List<DataBaseStudentInformation> _students = [];

  var _studentStreamController =
      StreamController<List<DataBaseStudentInformation>>.broadcast();
  Stream<List<DataBaseStudentInformation>> get studentStream =>
      _studentStreamController.stream;

  Future<DataBaseStudentInformation> createStudent(
      {required StudentInformation student, required int promoId}) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final result = await db.query(StudentInfoDb.studentTableName,
        limit: 1,
        where:
            "${StudentInfoDb.fnColumm} = ? AND ${StudentInfoDb.lnColumm} = ? AND ${StudentInfoDb.promoIDColumm} = ?",
        whereArgs: [student.fn, student.ln, promoId]);
    if (result.isNotEmpty) throw StudentAlreadyExistsException();
    final userId = await db.insert(StudentInfoDb.studentTableName, {
      StudentInfoDb.promoIDColumm: promoId,
      StudentInfoDb.fnColumm: student.fn,
      StudentInfoDb.lnColumm: student.ln,
      StudentInfoDb.yearColumm: student.year,
      StudentInfoDb.dobColumm: student.dob,
      StudentInfoDb.pobColumm: student.pob,
      StudentInfoDb.addressColumm: student.address,
      StudentInfoDb.parentnameColumm: student.parentName,
      StudentInfoDb.parentphonenumberColumm: student.parentPhoneNumber,
      StudentInfoDb.payementColumm: student.payment
    });

    final newStudent = DataBaseStudentInformation(
        promoId: promoId,
        id: userId,
        fn: student.fn,
        ln: student.ln,
        year: student.year,
        dob: student.dob,
        pob: student.pob,
        address: student.address,
        parentName: student.parentName,
        parentPhoneNumber: student.parentPhoneNumber,
        payment: student.payment);
    _students.add(newStudent);
    _studentStreamController.add(_students);
    return newStudent;
  }

  Future<Iterable<DataBaseStudentInformation>> getAllStudents(
      int promoId) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final promos = await db.query(StudentInfoDb.studentTableName,
        where: "${StudentInfoDb.promoIDColumm} = ?", whereArgs: [promoId]);
    return promos.map((n) => DataBaseStudentInformation.fromRow(n));
  }

  Future<void> cacheStudents(int promoId) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final results = await db.query(StudentInfoDb.studentTableName,
        where: "${StudentInfoDb.promoIDColumm} = ?", whereArgs: [promoId]);
    _students.clear();
    _students
        .addAll(results.map((row) => DataBaseStudentInformation.fromRow(row)));
    _studentStreamController.add(_students);
  }
}
