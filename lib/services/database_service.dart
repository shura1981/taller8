import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart' show join;
import 'package:taller8/models/users.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  /// getter to get the database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  /// create the database
  initDB() async {
    const String nameDb = 'UsuariosDB.db';
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // final path = documentsDirectory.path + nameDb;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, nameDb);

    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE usuarios('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'nombre TEXT NOT NULL,'
          'correo TEXT NOT NULL UNIQUE,'
          'celular TEXT,'
          'fecha_nacimiento TEXT NOT NULL'
          ')');
    });
  }

  // Future<dynamic> nuevoScand(Usuarios model) async {
  //   final db = await database;
  //   final res = await db!.insert('Scans', model.toJson());
  //   return res;
  // }

  Future<dynamic> nuevoUsuario(Usuarios model) async {
    final db = await database;
    final res = await db!.rawInsert(
        "INSERT INTO usuarios (nombre, correo, celular, fecha_nacimiento) VALUES ('${model.nombre}', '${model.correo}', '${model.celular}', '${model.fechaNacimiento}')");
    return res;
  }

  Future<dynamic> deleteUser(int i) async {
    final db = await database;
    final res = await db!.delete('usuarios', where: 'id = ?', whereArgs: [i]);
    return res;
  }

  Future<dynamic> deleteUserAll() async {
    final db = await database;
    final res = await db!.delete('usuarios');
    return res;
  }

  Future<dynamic> updateUser(int i, Usuarios model) async {
    final db = await database;
    final res = await db!
        .update('usuarios', model.toJson(), where: 'id = ?', whereArgs: [i]);
    return res;
  }

  Future<Usuarios?> getScandById(int i) async {
    final db = await database;
// final res = await db!.rawQuery('SELECT * FROM usuarios');
// return res.isNotEmpty ? Usuarios.fromJson(res.first) : null;
    final res = await db!.query('usuarios', where: 'id = ?', whereArgs: [i]);
    return res.isNotEmpty ? Usuarios.fromJson(res.first) : null;
  }

  Future<List<Usuarios?>> getUserAll() async {
    final db = await database;
    final res = await db!.rawQuery('SELECT * FROM usuarios');
    return res.isNotEmpty ? res.map((e) => Usuarios.fromJson(e)).toList() : [];
  }
}
