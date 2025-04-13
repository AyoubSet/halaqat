
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/util/constants/DB/db.dart';
import 'package:halaqat/util/constants/DB/promo_db.dart';
import 'package:halaqat/util/constants/DB/student_info_db.dart';
import 'package:halaqat/util/exceptions/crud_exceptions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Database? _db;
  static final Dbhelper _instance = Dbhelper._internal();
  Dbhelper._internal();
  factory Dbhelper() => _instance;
  Future<void> ensureDbIsOpen() async {
    try {
      await open();
    } on DBAlreadyOpenedException catch (_) {}
  }

  Future<void> open() async {
    if (_db != null) throw DBAlreadyOpenedException();
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, DB.dbName);
      final db = await openDatabase(dbPath);
      _db = db;
      await db.execute(PromoDb.promoTable);
      await db.execute(StudentInfoDb.studentTable);
      await PromoService().cachePromos();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DBAlreadyClosedException();
    } else {
      await db.close();
      _db = null;
    }
  }

  Database getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DataBaseIsNotOpenException();
    } else {
      return db;
    }
  }
}