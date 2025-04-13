import 'package:halaqat/util/constants/DB/db.dart';

abstract class PromoDb implements DB {
  static const promoNameTable = "Promo";
  static const idColumm = "ID";
  static const nameColumm = "Name";
  static const descriptionColumn = "Description";
  static const promoTable = """
      CREATE TABLE IF NOT EXISTS "Promo" (
        "ID"	INTEGER NOT NULL UNIQUE,
        "Name"	TEXT NOT NULL UNIQUE,
        "Description"	TEXT,
        PRIMARY KEY("ID" AUTOINCREMENT)
      );
      """;
}
