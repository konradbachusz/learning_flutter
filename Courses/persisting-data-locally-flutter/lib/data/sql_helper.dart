import '../models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class SqlHelper {
  final String colId = 'id';
  final String colName = 'name';
  final String colDate = 'date';
  final String colNotes = 'notes';
  final String colPosition = 'position';
  final String tableNotes = 'notes';

  static Database? _db;
  
  static SqlHelper _singleton = SqlHelper._internal();
  final int version = 1;

  factory SqlHelper() {
    return _singleton;
  }

  SqlHelper._internal();

  Future<Database> init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path, 'notes.db');
    Database dbNotes = await openDatabase(
      dbPath,
      version: version,
      onCreate: _createDb,
    );
    return dbNotes;
  }

  Future _createDb(Database db, int version) async {
    String query = 'CREATE TABLE $tableNotes ($colId INTEGER PRIMARY KEY, ' +
        '$colName TEXT, $colDate TEXT, $colNotes TEXT, $colPosition INTEGER)';
    await db.execute(query);
  }

  Future<List<Note>> getNotes() async {
    if (_db == null) _db = await init();
    //_db = _db ??= await init();
    List<Map<String, dynamic>> notesList =
        await _db!.query(tableNotes, orderBy: colPosition);
    List<Note> notes = [];
    notesList.forEach((element) {
      notes.add(Note.fromMap(element));
    });
    return notes;
  }

  Future<int> insertNote(Note note) async {
    note.position = await findPosition();
    int result = await _db!.insert(tableNotes, note.toMap());
    return result;
  }

  Future<int> updateNote(Note note) async {
    int result = await _db!.update(tableNotes, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> deleteNote(Note note) async {
    int result = await _db!
        .delete(tableNotes, where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> findPosition() async {
    final String sql = 'select max($colPosition) from $tableNotes';
    List<Map> queryResult = await _db!.rawQuery(sql);
    int? position = queryResult.first.values.first;
    position = (position == null) ? 0 : ++position;
    return position;
  }

  Future updatePositions(bool increment, int start, int end) async {
    String sql;
    if (increment) {
      sql = 'update $tableNotes set $colPosition = $colPosition + 1 ' +
          'where $colPosition >= $start and $colPosition <= $end';
    } else {
      sql = 'update $tableNotes set $colPosition = $colPosition - 1 ' +
          'where $colPosition >= $start and $colPosition <= $end';
    }
    await _db!.rawUpdate(sql);
  }
}
