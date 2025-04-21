//* Imports
import 'package:halaqat/util/constants/DB/db_helper.dart';
import 'dart:async';
import 'package:halaqat/data/models/promo_db.dart';
import 'package:halaqat/util/constants/DB/promo_db.dart';
import 'package:halaqat/util/exceptions/crud_exceptions.dart';
class PromoService {
  //* Attributes
  List<DataBasePromo> _promos = [];
  DataBasePromo? currentPromo;
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

  Future<void> updateSelectedPromo({required String name}) async{
    currentPromo = await getPromoByName(name: name);
  }
  Future<void> deletePromo({
    required int id,
  }) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final deletedCount = await db.delete(
      PromoDb.promoNameTable,
      where: "ID = ?",
      whereArgs: [id],
    );
    if (deletedCount == 0) {
      throw CouldNotDeletePromoException();
    } else {
      final countBefore = _promos.length;
      _promos.removeWhere((promo) => promo.id == id);
      if (_promos.length != countBefore) {
        _promosStreamController.add(_promos);
      }
    }
  }

  Future<void> deletePromoByName({
    required String name,
  }) async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final deletedCount = await db.delete(
      PromoDb.promoNameTable,
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
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final results = await db.query(
      PromoDb.promoNameTable,
      limit: 1,
      where: "Name = ?",
      whereArgs: [name],
    );
    if (results.isNotEmpty) {
      throw PromoAlreadyExistsException();
    }
    final userId = await db.insert(PromoDb.promoNameTable, {
      PromoDb.nameColumm: name, 
      PromoDb.descriptionColumn: description, 
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
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final results = await db
        .query(PromoDb.promoNameTable, limit: 1, where: "ID = ?", whereArgs: [id]);
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
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final results = await db
        .query(PromoDb.promoNameTable, limit: 1, where: "Name = ?", whereArgs: [name]);
    if (results.isEmpty) {
      throw PromoDoesntExistsException();
    } else {
      final updatedPromo = DataBasePromo.fromRow(results.first);
      _promos.removeWhere((promo) => promo.id == updatedPromo.id);
      _promos.add(updatedPromo);
      _promosStreamController.add(_promos);
      return updatedPromo;
    }
  }

  Future<Iterable<DataBasePromo>> getAllPromos() async {
    await Dbhelper().ensureDbIsOpen();
    final db = Dbhelper().getDatabaseOrThrow();
    final promos = await db.query(PromoDb.promoNameTable);
    return promos.map((n) => DataBasePromo.fromRow(n));
  }

  Future<void> cachePromos() async {
    final allPromos = await getAllPromos();
    _promos = allPromos.toList();
    _promosStreamController.add(_promos);
  }
}
