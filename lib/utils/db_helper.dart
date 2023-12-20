import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String tableName = 'shops';

class DatabaseHelper {
  static Future<Database> createDatabase() async {
    final String path = join(await getDatabasesPath(), 'shops.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            completed INTEGER
          )
          ''',
        );
      },
    );
  }
}