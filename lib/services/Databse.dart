import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const dbName = "myDatabase.db";
  static const dbversion = 1;
  static const dbTable = "todolist";
  static const columnId = "id";
  static const columnTitle = "title";
  static const columnDescription = "description";
  static const columnDate = "date";

  static final DatabaseHelper instance = DatabaseHelper();

  static Database? _database;

  Future<Database?> get database async {
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return openDatabase(path, version: dbversion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute(''' CREATE TABLE $dbTable(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $columnTitle TEXT ,
        $columnDescription TEXT ,
        $columnDate TEXT 
      )''');
  }

  insert(Map<String, dynamic> row) async {
    await initDB();
    Database? db = await instance.database;
    return await db!
        .insert(dbTable, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryDatabase() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    String id = row[columnId];
    return await db!
        .update(dbTable, row, where: '$columnId=?', whereArgs: [id]);
  }

  Future<int> deleteRecored(int id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<void> ins( String title, String description ,String Date) async {

    await DatabaseHelper.instance.insert({

      DatabaseHelper.columnTitle: "$title",
      DatabaseHelper.columnDescription: "$description",
      DatabaseHelper.columnDate: "$Date"
    });
  }
  
}
