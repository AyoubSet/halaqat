//TODO : Add comments here
const dbName = 'halaqat.db';
const promoNameTable = "Promo";
const idColumm = "ID";
const nameColumm = "Name";
const descriptionColumn = "Description";
const promoTable = """
      CREATE TABLE IF NOT EXISTs "Promo" (
        "ID"	INTEGER NOT NULL UNIQUE,
        "Name"	TEXT NOT NULL UNIQUE,
        "Description"	TEXT,
        PRIMARY KEY("ID" AUTOINCREMENT)
      );
      """;
