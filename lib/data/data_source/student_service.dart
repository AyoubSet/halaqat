// ignore_for_file: unused_field

import 'dart:async';
import 'package:halaqat/data/models/student_info_db.dart';


class StudentService {
  static final StudentService _studentsService = StudentService._init();
  StudentService._init(); 
  factory StudentService() => _studentsService;

  final List<DataBaseStudentInformation> _students = [];

  final _studentStreamController = StreamController<List<DataBaseStudentInformation>>.broadcast();
  Stream<List<DataBaseStudentInformation>> get studentStream => _studentStreamController.stream;

  
}
