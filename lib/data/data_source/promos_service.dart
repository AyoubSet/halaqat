//* Imports

import 'dart:async';
import 'package:halaqat/data/models/promo_db.dart';
import 'package:halaqat/util/constants/db.dart';
import 'package:halaqat/util/exceptions/crud_exceptions.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class PromoService {
  //* Attributes
  Database? _db;
  List<DataBasePromo> _promos = [];
  DataBasePromo? currentPromo ;
  late final StreamController<List<DataBasePromo>> _promosStreamController;

  //* Singleton
  static final PromoService _promoService = PromoService._init();
  PromoService._init(){
    _promosStreamController = StreamController<List<DataBasePromo>>.broadcast(
      onListen: (){
        _promosStreamController.sink.add(_promos);
      }
    );
  }
  factory PromoService() {
    return _promoService;
  }

  //* Methodes
  Stream<List<DataBasePromo>> get allPromos => _promosStreamController.stream;

  Future<void> ensureDbIsOpen() async {
    try {
      await open();
    } on DBAlreadyOpenedException catch (_) {}
  }

  Future<void> open() async {
    if (_db != null) throw DBAlreadyOpenedException();
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;
      await db.execute(promoTable);
      await _cachePromos();
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

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DataBaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> deletePromo({
    required int id,
  }) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      promoNameTable,
      where: "ID = ?",
      whereArgs: [id],
    );
    if (deletedCount == 0) {
      throw CouldNotDeletePromoException();
    } else {
      final countBefore = _promos.length;
      _promos.removeWhere((note) => note.id == id);
      if (_promos.length != countBefore) {
        _promosStreamController.add(_promos);
      }
    }
  }

  Future<void> deletePromoByName({
    required String name,
  }) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      promoNameTable,
      where: "Name = ?",
      whereArgs: [name],
    );
    if (deletedCount == 0) {
      throw CouldNotDeletePromoException();
    } else {
      final promoToDelete = await getPromoByName(name: name);
      final countBefore = _promos.length;
      _promos.removeWhere((promo) => promo == promoToDelete);
      if (_promos.length != countBefore) {
        _promosStreamController.add(_promos);
      }
    }
  }
  
  Future<DataBasePromo> createPromo(
      {required String name, required String description}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      promoNameTable,
      limit: 1,
      where: "Name = ?",
      whereArgs: [name],
    );
    if (results.isNotEmpty) {
      throw PromoAlreadyExistsException();
    }
    final userId = await db.insert(promoNameTable, {
      nameColumm: name, 
      descriptionColumn: description, 
    });
    final newPromo = DataBasePromo(
      id: userId,
      name: name,
      descrption: description, 
    );

    _promos.add(newPromo);
    _promosStreamController.add(List.from(_promos)); 
    return newPromo;
  }

  Future<DataBasePromo> getPromoByID({required int id}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db
        .query(promoNameTable, limit: 1, where: "ID = ?", whereArgs: [id]);
    if (results.isEmpty) {
      throw PromoDoesntExistsException();
    } else {
      final updatedPromo = DataBasePromo.fromRow(results.first);
      _promos.removeWhere((note) => note.id == updatedPromo.id);
      _promos.add(updatedPromo);
      _promosStreamController.add(_promos);
      return updatedPromo;
    }
  }

  Future<DataBasePromo> getPromoByName({required String name}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db
        .query(promoNameTable, limit: 1, where: "Name = ?", whereArgs: [name]);
    if (results.isEmpty) {
      throw PromoDoesntExistsException();
    } else {
      final updatedPromo = DataBasePromo.fromRow(results.first);
      _promos.removeWhere((note) => note.id == updatedPromo.id);
      _promos.add(updatedPromo);
      _promosStreamController.add(_promos);
      return updatedPromo;
    }
  }

  Future<Iterable<DataBasePromo>> getAllPromos() async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final promos = await db.query(promoNameTable);
    return promos.map((n) => DataBasePromo.fromRow(n));
  }

  Future<void> _cachePromos() async {
    final allNotes = await getAllPromos();
    _promos = allNotes.toList();
    _promosStreamController.add(_promos);
  }
}
