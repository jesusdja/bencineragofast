import 'package:bencineragofast/pages/sqlflite/favoritos.dart';
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
  String tablefavoritos = 'Favoritos';
  String colId = 'idTable';
  String idGasolinera = 'idGasolinera';
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

    await db.execute(
        "CREATE TABLE Favoritos(idGasolinera INT)");
  }


  Future<int> saveUser(User user) async {
    var dbClient = await database;
    int res = await dbClient.insert("Usersx", user.toMap());
    return res;
  }

  Future<int> saveFav(Favoritos favoritos) async {
    var dbClient = await database;
    int res = await dbClient.insert("Favoritos", favoritos.toMap());
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
  Future<List<Map<String, dynamic>>> queryAllRowsFavoritos() async {
    Database db = await _instance.database;
    return await db.query(tablefavoritos);
  }


  Future<int> queryRowCount() async {
    Database db = await _instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> queryRowCountCarro() async {
    Database db = await _instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tablecarro'));
  }

  Future<int> queryRowCountFavoritos() async {
    Database db = await _instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tablefavoritos'));
  }
  Future<User> getUser() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Usersx');
    var user =
    new User(list[0][
      "idTable"],
      list[0]["deviceId"],
      list[0]["botonDisGas"],
      list[0]["botonTipoGas"]
    );
    return user;
  }
  Future<Favoritos> getfavoritos() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Favoritos');
    var favoritos =
    new Favoritos(list[0]["idGasolinera"],
    );
    return favoritos;
  }
  Future<List<int>> getfavo() async {
    var dbClient = await database;
    List<int> res = new List<int>();
    List<Map> list = await dbClient.rawQuery('SELECT idGasolinera FROM Favoritos');
    for(int i=0 ; i< list.length; i++){
      res.add(list[i]["idGasolinera"]);
    }
    return res;
  }
  Future<Vehiculo> getCarro() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Carro');
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
  Future<int> deleteFavoritos(Favoritos favoritos) async {
    var dbClient = await database;
    int res =
    await dbClient.rawDelete('DELETE FROM Favoritos WHERE idGasolinera = ?', [favoritos.idGasolinera]);
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
    return await dbClient.rawUpdate(
        'UPDATE $table SET $colbtngas = \'${user.botonTipoGas}\' WHERE $colId = ${user.idTable}');
  }

  Future<int> updateBtnDis(User user) async {
    var dbClient = await  database;
    return await dbClient.rawUpdate(
        'UPDATE $table SET $colBtnDis = \'${user.botonDisGas}\' WHERE $colId = ${user.idTable}');
  }
  Future<int> updateCarro(Vehiculo vehiculo) async {
    var dbClient = await  database;
    return await dbClient.rawUpdate(
        'UPDATE $tablecarro SET marcaVehiculo = \'${vehiculo.marcaVehiculo}\',modeloVehiculo = \'${vehiculo.modeloVehiculo}\',yearsVehiculo = \'${vehiculo.yearsVehiculo}\',combustible = \'${vehiculo.combustible}\',idMarca = \'${vehiculo.idMarca}\',idModelo = \'${vehiculo.idModelo}\',idYears = \'${vehiculo.idYears}\',idCombustible = \'${vehiculo.idCombustible}\' WHERE $colId = ${vehiculo.idTable}');
  }

  Future<User> getId(int id) async {
    var dbClient = await database;
    List<Map> result = await dbClient.query(table,
        columns: [colIdDevice,colbtngas,colBtnDis],
        where: '$colId = ?',
        whereArgs: [id]);
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

  Future<int> verificarIdFavoritos(int id) async {
    var dbClient = await database;
    var result = await dbClient.rawQuery('SELECT * FROM $tablefavoritos WHERE $idGasolinera = $id');
    return result.length;
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
