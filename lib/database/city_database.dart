import 'package:sqflite/sqflite.dart';

class CityDatabase {
  Database db;

  CityDatabase() {}

  void deleteDB() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + "/" + 'demo.db';
    await deleteDatabase(path);
  }

  Future<void> openDB() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + "/" + 'demo.db';

    print("db wird eingerichtet");
    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE stadt (id INTEGER PRIMARY KEY, name TEXT, plz TEXT)');
      await db.execute(
          'CREATE TABLE attraktionen (id INTEGER PRIMARY KEY, name TEXT, beschreibung TEXT, bild TEXT, idStadt INTEGER, FOREIGN KEY(idStadt) REFERENCES stadt(id))');
    });
  }

  void addStadt(String name, String plz) async {
    int count = await db
        .rawInsert('INSERT INTO stadt(name, plz) VALUES(?, ?)', [name, plz]);
    print(count);
  }

  void addAttraktionen(String name, String beschreibung, String bild, int idStadt) async {
    int count = await db.rawInsert(
        'INSERT INTO attraktionen(name, beschreibung, bild, idStadt) VALUES(?, ?, ?, ?)',
        [name, beschreibung, bild, idStadt]);
    print(count);
  }

  void alleStaedte() async {
    List<Map> list = await db.rawQuery('SELECT * FROM stadt');
    print(list);
  }

  Future<List<Map>> getStaedte() async {
    List<Map> list = await db.rawQuery('SELECT * FROM stadt');
    return list;
  }

  Future<List<Map>> getAttraktionen(int idStadtAktuell) async {
    List<Map> list = await db.rawQuery('SELECT * FROM attraktionen WHERE idStadt = $idStadtAktuell');
    return list;
  }
}
