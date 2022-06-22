import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:myfoodapp/entitas/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myfoodapp/login.dart';
import 'package:path/path.dart  ';
import 'package:myfoodapp/entitas/note.dart';

class DbHelper {
  final DbHelper _dbHelper;
  late final Database _database;

  DbHelper._createObject(this._dbHelper, this._database);

  factory DbHelper() {
    if (DbHelper == null) {
      DbHelper._createObject;
    }
    return DbHelper();
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'data.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    return todoDatabase;
  }

  //buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profil (
        id INT PRIMARY KEY,
        username TEXT, 
        email TEXT, 
        nama TEXT
      );
    ''');
  }

//seo TEXT,
  //      Resume TEXT
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    } else {}
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('profil', orderBy: 'name');
    return mapList;
  }

  Future<List<Profil>> getProfil() async {
    var profilMapList = await select();
    int count = profilMapList.length;
    List<Profil> profilList = <Profil>[];
    for (int i = 0; i < count; i++) {
      profilList.add(Profil.fromMap(profilMapList[i]));
    }
    return profilList;
  }
}
