import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'user_data.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE User(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          User_Code TEXT,
          User_Display_Name TEXT,
          Email TEXT,
          User_Employee_Code TEXT,
          Company_Code TEXT
        )
      ''');
    });
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final dbClient = await db;
    return await dbClient.insert('User', user);
  }

  Future<Map<String, dynamic>?> getUser() async {
    final dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query('User');
    if (result.isNotEmpty) return result.first;
    return null;
  }
}
