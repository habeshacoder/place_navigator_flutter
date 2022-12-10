import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static Future<Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      version: 1,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY ,title TEXT ,image TEXT)'),
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.dataBase();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List> fetchData(String table) async {
    final db = await DbHelper.dataBase();
    return db.query(table);
  }
}
