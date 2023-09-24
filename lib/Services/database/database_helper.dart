import 'package:simple_tetris/services/database/database.dart';
import 'package:simple_tetris/constants/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  MyDatabase myDatabase = MyDatabase();

  Future<int> create(Map map) async {
    DateTime nowDate = DateTime.now();
    int nowInt = nowDate.millisecondsSinceEpoch;

    Database? db = await myDatabase.db;
    int x = await db!.rawInsert('''   
       INSERT INTO ${DatabaseConstants.tableName}  
      (${DatabaseConstants.columnNameName} ,${DatabaseConstants.columnNameScore},${DatabaseConstants.columnNameDate} )
       VALUES (?,?,?)
       ''', [map['name'], map['score'], nowInt]);

    return x;
  }

  Future<List<Map<String, dynamic>>> read() async {
    Database? db = await myDatabase.db;
    List<Map<String, dynamic>> x = await db!.rawQuery('''
      SELECT * FROM ${DatabaseConstants.tableName}
      ORDER BY ${DatabaseConstants.columnNameScore} DESC
      ''');

    return x;
  }
}
