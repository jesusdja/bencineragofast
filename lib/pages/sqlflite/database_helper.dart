import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'User.dart';
import 'vehiculo.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _database;
  String table = 'Usersx';
  String tablecarro = 'Carro';
  String colId = 'idTable';
  String colIdDevice = 'deviceId';
  String colbtngas = 'botonTipoGas';
  String colBtnDis = 'botonDisGas';

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;

  }
  DatabaseHelper.internal();
  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path +'Userx.db';

    var notesDatabase = await openDatabase(path,version: 1, onCreate: _onCreate);
    return notesDatabase;


  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Usersx(idTable INT PRIMARY KEY, deviceId TEXT, botonDisGas TEXT , botonTipoGas TEXT)");

    await db.execute(
        "CREATE TABLE Carro(idTable INT PRIMARY KEY, marcaVehiculo TEXT, modeloVehiculo TEXT , yearsVehiculo TEXT,combustible TEXT, idMarca TEXT,idModelo TEXT,idYears TEXT,idCombustible TEXT)");
  }


  Future<int> saveUser(User user) async {
    var dbClient = await database;
    int res = await dbClient.insert("Usersx", user.toMap());
    return res;
  }
  Future<int> saveCarro(Vehiculo vehiculo) async {
    var dbClient = await database;
    int res = await dbClient.insert("Carro", vehiculo.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await _instance.database;
    return await db.query(table);
  }
  Future<List<Map<String, dynamic>>> queryAllRowsCarro() async {
    Database db = await _instance.database;
    return await db.query(tablecarro);
  }


  Future<int> queryRowCount() async {
    Database db = await _instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> queryRowCountCarro() async {
    Database db = await _instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tablecarro'));
  }


  Future<User> getUser() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Usersx');
    List<User> employees = new List();

    var user =
    new User(list[0][
      "idTable"],
      list[0]["deviceId"],
      list[0]["botonDisGas"],
      list[0]["botonTipoGas"]
    );
    return user;
  }

  Future<Vehiculo> getCarro() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Carro');
    List<Vehiculo> employees = new List();
    var vehiculo =
    new Vehiculo(list[0]["idTable"],
        list[0]["marcaVehiculo"],
        list[0]["modeloVehiculo"],
        list[0]["yearsVehiculo"],
        list[0]["combustible"],
        list[0]["idMarca"],
        list[0]["idModelo"],
        list[0]["idYears"],
        list[0]["idCombustible"],
    );
    return vehiculo;
  }

  Future<int> deleteUsers(User user) async {
    var dbClient = await database;

    int res =
    await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user.idTable]);
    return res;
  }
  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }

   Future<bool> verificar(User user) async {
    var dbClient = await database;

    int res =   await dbClient.update("Usersx", user.toMap(),
        where: "idTable = ?", whereArgs: <int>[user.idTable]);
      print(res);
    return res > 0 ? true : false;
  }

  Future<int> updatebtngas(User user) async {
    var dbClient = await  database;
    //   return await dbClient.update(tableNote, note.toMap(), where: "$columnId = ?", whereArgs: [note.id]);
    /*return await dbClient.rawUpdate(
        'UPDATE $table SET $colbtngas = \'${user.botonDisGas}\' WHERE $colId = ${user.idTable}');*/
    return await dbClient.rawUpdate(
        'UPDATE $table SET $colbtngas = \'${user.botonTipoGas}\' WHERE $colId = ${user.idTable}');
  }

  Future<int> updateBtnDis(User user) async {
    var dbClient = await  database;
    //   return await dbClient.update(tableNote, note.toMap(), where: "$columnId = ?", whereArgs: [note.id]);
    /*return await dbClient.rawUpdate(
        'UPDATE $table SET $colbtngas = \'${user.botonDisGas}\' WHERE $colId = ${user.idTable}');*/
    return await dbClient.rawUpdate(
        'UPDATE $table SET $colBtnDis = \'${user.botonDisGas}\' WHERE $colId = ${user.idTable}');
  }
  Future<int> updateCarro(Vehiculo vehiculo) async {
    var dbClient = await  database;
    //   return await dbClient.update(tableNote, note.toMap(), where: "$columnId = ?", whereArgs: [note.id]);
    /*return await dbClient.rawUpdate(
        'UPDATE $table SET $colbtngas = \'${user.botonDisGas}\' WHERE $colId = ${user.idTable}');*/
    return await dbClient.rawUpdate(
        'UPDATE $tablecarro SET marcaVehiculo = \'${vehiculo.marcaVehiculo}\',modeloVehiculo = \'${vehiculo.modeloVehiculo}\',yearsVehiculo = \'${vehiculo.yearsVehiculo}\',combustible = \'${vehiculo.combustible}\',idMarca = \'${vehiculo.idMarca}\',idModelo = \'${vehiculo.idModelo}\',idYears = \'${vehiculo.idYears}\',idCombustible = \'${vehiculo.idCombustible}\' WHERE $colId = ${vehiculo.idTable}');
  }

  Future<User> getId(int id) async {
    var dbClient = await database;
    List<Map> result = await dbClient.query(table,
        columns: [colIdDevice,colbtngas,colBtnDis],
        where: '$colId = ?',
        whereArgs: [id]);
    var result2 = await dbClient.rawQuery('SELECT * FROM $table WHERE $colId = $id');

   // print(result.length);

    if (result.length > 0) {
      return new User.fromMap(result.first);
    }

    return null;
  }

  Future<User> getIdDevice(int id) async {
    var dbClient = await database;

    var result = await dbClient.rawQuery('SELECT * FROM $table WHERE $colId = $id');


    if (result.length > 0) {
      return new User.fromMap(result.first);
    }

    return null;
  }
  Future<Vehiculo> getmarca(int id) async {
    var dbClient = await database;

    var result = await dbClient.rawQuery('SELECT * FROM $tablecarro WHERE idTable = $id');


    if (result.length > 0) {
      return new Vehiculo.fromMap(result.first);
    }

    return null;
  }

}
