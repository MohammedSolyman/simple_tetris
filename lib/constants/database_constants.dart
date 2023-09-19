class DatabaseConstants {
  static const String tableName = 'toplist';

  static const String columnNameId = 'id';
  static const String columnNameName = 'name';
  static const String columnNameScore = 'score';
  static const String columnNameDate = 'date';

  static const String columnTypeId = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String columnTypeName = 'TEXT    NOT NULL';
  static const String columnTypeScore = 'INTEGER NOT NULL';
  static const String columnTypeDate = 'INTEGER NOT NULL';
}
