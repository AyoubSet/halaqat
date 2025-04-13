import 'package:halaqat/util/constants/DB/db.dart';

abstract class StudentInfoDb implements DB {
  static const studentTableName = "Student";
  static const idColumm = "ID";
  static const promoIDColumm = "Promo_ID";
  static const fnColumm = "First_Name";
  static const lnColumm = "Last_Name";
  static const yearColumm = "Year";
  static const dobColumm = "Dob";
  static const pobColumm = "Pob";
  static const addressColumm = "Address";
  static const parentnameColumm = "Parent_Name";
  static const parentphonenumberColumm = "Parent_Phone_Number";
  static const payementColumm = "Payement";

  static const studentTable = """
    CREATE TABLE IF NOT EXISTS "Student" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Promo_ID"	INTEGER NOT NULL,
	"First_Name"	TEXT NOT NULL,
	"Last_Name"	TEXT NOT NULL,
	"Year"	INTEGER NOT NULL,
	"Dob"	NUMERIC NOT NULL,
	"Pob"	NUMERIC NOT NULL,
	"Address"	TEXT NOT NULL,
	"Parent_Name"	INTEGER NOT NULL,
	"Parent_Phone_Number"	TEXT NOT NULL,
	"Payment"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Promo_ID") REFERENCES "Promo"("ID") ON DELETE CASCADE
);
  """;
}
