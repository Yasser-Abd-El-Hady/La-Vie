import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteHelper {
  static const _dbName = 'myCart.db';
  static const _dbVersion = 1;
  static const _tableName = 'Cart.db';
  static const _columnProductId = '_id';
  static const _columnUserId = 'userId';
  static const _columnCount = 'count';

  SQLiteHelper._();

  static final SQLiteHelper instance = SQLiteHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initializeDatabase();
    return _database!;
  }

  initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, _dbName);
    _database = await openDatabase(path, version: _dbVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
CREATE TABLE $_tableName(
  $_columnProductId INTEGER PRIMARY KEY,
  $_columnUserId TEXT NOT NULL,
  $_columnCount TEXT NOT NULL,
)
''');
    });
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<Map<String, dynamic>> getById(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> singleElement = await db.query(_tableName);
    final returenedElement = singleElement.reduce((value, element) {
      if (value['_id'] == id) {
        return value;
      } else {
        return element;
      }
    });
    return returenedElement;
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(_tableName, row,
        where: '$_columnProductId = ?', whereArgs: [row[_columnProductId]]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(_tableName, where: '$_columnProductId = ?', whereArgs: [id]);
  }
}
