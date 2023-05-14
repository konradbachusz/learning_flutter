import 'dart:async';
import 'package:globeapp/data/sembast_codec.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../models/password.dart';

class SembastDb {
  DatabaseFactory dbFactory = databaseFactoryIo;
  Database _db;
  final store = intMapStoreFactory.store('passwords');
  var codec = getEncryptSembastCodec(password: 'Password');
  static SembastDb _singleton = SembastDb._internal();

  SembastDb._internal();

  factory SembastDb() {
    return _singleton;
  }

  Future<Database> init() async {
    if (_db == null) {
      _db = await _openDb();
    }
    return _db;
  }

  Future _openDb() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docsDir.path, 'pass.db');
    final db = await dbFactory.openDatabase(dbPath, codec: codec);
    return db;
  }

  Future<int> addPassword(Password password) async {
    int id = await store.add(_db, password.toMap());
    return id;
  }

  Future getPasswords() async {
    await init();
    final finder = Finder(sortOrders: [SortOrder('name')]);
    final snapshot = await store.find(_db, finder: finder);
    return snapshot.map((item) {
      final pwd = Password.fromMap(item.value);
      pwd.id = item.key;
      return pwd;
    }).toList();
  }

  Future updatePassword(Password pwd) async {
    final finder = Finder(filter: Filter.byKey(pwd.id));
    await store.update(_db, pwd.toMap(), finder: finder);
  }

  Future deletePassword(Password pwd) async {
    final finder = Finder(filter: Filter.byKey(pwd.id));
    await store.delete(_db, finder: finder);
  }

  Future deleteAll() async {
    await store.delete(_db);
  }
}
