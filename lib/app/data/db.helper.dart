import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modules/anggaran_page/views/anggaran_model.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    return await initDb();
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'anggaran.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE anggaran(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            jumlah INTEGER
          )
        ''');
      },
    );
  }

  static Future<int> insertAnggaran(AnggaranModel data) async {
    final db = await database;
    return await db.insert('anggaran', data.toMap());
  }

  static Future<List<AnggaranModel>> getAllAnggaran() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('anggaran');
    return List.generate(maps.length, (i) => AnggaranModel.fromMap(maps[i]));
  }

  static Future<int> deleteAnggaran(int id) async {
    final db = await database;
    return await db.delete('anggaran', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateAnggaran(AnggaranModel data) async {
    final db = await database;
    return await db.update('anggaran', data.toMap(),
        where: 'id = ?', whereArgs: [data.id]);
  }
}
