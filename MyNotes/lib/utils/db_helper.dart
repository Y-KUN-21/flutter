import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:mytask/models/notes.dart';

class DbHelper {
  static DbHelper _databaseHelper;
  static Database _database;

  String noteTable = "notes";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  DbHelper._createInstance();

  factory DbHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DbHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "notes.db";

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createdb);
    return notesDatabase;
  }

  void _createdb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  //fetch all objects
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var results = await db.query(noteTable, orderBy: '$colPriority ASC');
    return results;
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var results = await db.insert(noteTable, note.toMap());
    return results;
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var results = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return results;
  }

  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var results =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return results;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT * FROM $noteTable');
    int results = Sqflite.firstIntValue(x);
    return results;
  }

  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;

    List<Note> noteList = List<Note>();
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }
    return noteList;
  }
}
