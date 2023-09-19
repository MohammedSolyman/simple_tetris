import 'package:simple_tetris/constants/database_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      return await initializeDb();
    } else {
      return _db;
    }
  }

  Future<String> getPath() async {
    String s = await getDatabasesPath();
    return join(s, 'myDatabase.db');
  }

  Future<void> _onCreate(Database database, int i) async {
    await database.execute('''
      CREATE TABLE ${DatabaseConstants.tableName} (
        ${DatabaseConstants.columnNameId} ${DatabaseConstants.columnTypeId},
        ${DatabaseConstants.columnNameName} ${DatabaseConstants.columnTypeName},
        ${DatabaseConstants.columnNameScore} ${DatabaseConstants.columnTypeScore},
        ${DatabaseConstants.columnNameDate} ${DatabaseConstants.columnTypeDate}
);
''');
  }

  Future<Database> initializeDb() async {
    return await openDatabase(await getPath(), onCreate: _onCreate, version: 1);
  }
}
