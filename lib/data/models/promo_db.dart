import 'package:flutter/material.dart';
import 'package:halaqat/util/constants/db.dart';

@immutable
class DataBasePromo {
  final int id;
  final String name;
  final String descrption;

  const DataBasePromo({
    required this.id,
    required this.name,
    required this.descrption,
  });

  DataBasePromo.fromRow(Map<String, Object?> map)
      : id = map[idColumm] as int,
        name = map[nameColumm] as String,
        descrption = map[descriptionColumn] as String;

  @override
  String toString() => "ID Name:Description = $id $name:$descrption";

  @override
  bool operator ==(covariant DataBasePromo other) {
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
