// ignore_for_file: unused_field

import 'dart:async';
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

  Future<void> deleteStudent(
      {required String fn, required String ln, required int promoId}) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final studentId = await _getIdFromName(fn, ln);
    final deleteCount = await db.delete(StudentInfoDb.studentTableName,
        where:
            "${StudentInfoDb.idColumm} = ? AND ${StudentInfoDb.promoIDColumm} = ?",
        whereArgs: [studentId, promoId]);
    if (deleteCount == 0) {
      throw CouldNotDeleteStudentException();
    } else {
      final countBefore = _students.length;
      _students.removeWhere((student) => studentId == student.id);
      if(countBefore != _students.length){
        _studentStreamController.add(_students);
      }
    }
  }

  Future<DataBaseStudentInformation> getStudentById({required int id}) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final results = await db.query(StudentInfoDb.studentTableName,
        where: "${StudentInfoDb.idColumm} = ?", whereArgs: [id]);
    if (results.isEmpty) {
      throw StudentDoesntExistsException();
    } else{
      final updatedStudent = DataBaseStudentInformation.fromRow(results.first);
      _students.removeWhere((student) => student.id == updatedStudent.id);
      _students.add(updatedStudent);
      _studentStreamController.add(_students);
      return updatedStudent;
    }
  }

  Future<int> _getIdFromName(String fn, String ln) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final results = await db.query(StudentInfoDb.studentTableName,
        limit: 1,
        where:
            "${StudentInfoDb.fnColumm} = ? AND ${StudentInfoDb.lnColumm} = ?",
        whereArgs: [fn, ln]);
    if (results.isEmpty) throw StudentDoesntExistsException();
    return results.first[StudentInfoDb.idColumm] as int;
  }
}
