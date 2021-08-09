import 'package:sqflite/sqflite.dart';

class CityDatabase {
  Database db;

  CityDatabase() {}

  // Datenbank löschen
  void deleteDB() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + "/" + 'demo.db';
    await deleteDatabase(path);
  }

  // Datenbank und Tabellen erstellen
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
          'CREATE TABLE attraktionen (id INTEGER PRIMARY KEY, name TEXT, beschreibung TEXT, link Text, bild TEXT, idStadt INTEGER, FOREIGN KEY(idStadt) REFERENCES stadt(id))');
      await db.execute(
          'CREATE TABLE sehenswuerdigkeiten (id INTEGER PRIMARY KEY, name TEXT, beschreibung TEXT, link Text, bild TEXT, idStadt INTEGER, FOREIGN KEY(idStadt) REFERENCES stadt(id))');
      await db.execute(
          'CREATE TABLE restaurants (id INTEGER PRIMARY KEY, name TEXT, beschreibung TEXT, link Text, bild TEXT, idStadt INTEGER, FOREIGN KEY(idStadt) REFERENCES stadt(id))');
      await db.execute(
          'CREATE TABLE einkaufslaeden (id INTEGER PRIMARY KEY, name TEXT, beschreibung TEXT, link Text, bild TEXT, idStadt INTEGER, FOREIGN KEY(idStadt) REFERENCES stadt(id))');
    });
  }

  // Methoden, beginnend mit "add. . .", fügen Einträge in die entsprechende Tabelle ein
  void addStadt(String name, String plz) async {
    int count = await db
        .rawInsert('INSERT INTO stadt(name, plz) VALUES(?, ?)', [name, plz]);
    print(count);
  }

  void addAttraktionen(String name, String beschreibung, String link, String bild, int idStadt) async {
    int count = await db.rawInsert(
        'INSERT INTO attraktionen(name, beschreibung, link, bild, idStadt) VALUES(?, ?, ?, ?, ?)',
        [name, beschreibung, link, bild, idStadt]);
    print(count);
  }

  void addSehenswuerdigkeiten(String name, String beschreibung, String link, String bild, int idStadt) async {
    int count = await db.rawInsert(
        'INSERT INTO sehenswuerdigkeiten(name, beschreibung, link, bild, idStadt) VALUES(?, ?, ?, ?, ?)',
        [name, beschreibung, link, bild, idStadt]);
    print(count);
  }

  void addRestaurants(String name, String beschreibung, String link, String bild, int idStadt) async {
    int count = await db.rawInsert(
        'INSERT INTO restaurants(name, beschreibung, link, bild, idStadt) VALUES(?, ?, ?, ?, ?)',
        [name, beschreibung, link, bild, idStadt]);
    print(count);
  }

  void addEinkaufslaeden(String name, String beschreibung, String link, String bild, int idStadt) async {
    int count = await db.rawInsert(
        'INSERT INTO einkaufslaeden(name, beschreibung, link, bild, idStadt) VALUES(?, ?, ?, ?, ?)',
        [name, beschreibung, link, bild, idStadt]);
    print(count);
  }

  void alleStaedte() async {
    List<Map> list = await db.rawQuery('SELECT * FROM stadt');
    print(list);
  }

  // Methoden, beginnend mit "get. . .", um die Einträge in der entsprechenden Tabelle anzuzeigen
  Future<List<Map>> getStaedte() async {
    List<Map> list = await db.rawQuery('SELECT * FROM stadt');
    return list;
  }

  Future<List<Map>> getAttraktionen(int idStadtAktuell) async {
    List<Map> list = await db.rawQuery('SELECT * FROM attraktionen WHERE idStadt = $idStadtAktuell');
    return list;
  }

  Future<List<Map>> getSehenswuerdigkeiten(int idStadtAktuell) async {
    List<Map> list = await db.rawQuery('SELECT * FROM sehenswuerdigkeiten WHERE idStadt = $idStadtAktuell');
    return list;
  }

  Future<List<Map>> getRestaurants(int idStadtAktuell) async {
    List<Map> list = await db.rawQuery('SELECT * FROM restaurants WHERE idStadt = $idStadtAktuell');
    return list;
  }

  Future<List<Map>> getEinkaufslaeden(int idStadtAktuell) async {
    List<Map> list = await db.rawQuery('SELECT * FROM einkaufslaeden WHERE idStadt = $idStadtAktuell');
    return list;
  }
}
