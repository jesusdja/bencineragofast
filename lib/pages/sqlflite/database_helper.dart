import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'note.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _database;
  String noteTable = 'note_table';
  String colId = 'id';
  String colModel = 'ModelUser';

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;

  }
  DatabaseHelper.internal();
  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path +'User.db';

    var notesDatabase = await openDatabase(path,version: 1, onCreate: _onCreate);
    return notesDatabase;


  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, modelUser TEXT)");
  }

  Future<int> saveUser(User user) async {
    var dbClient = await database;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }


  Future<List<User>> getUser() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
      new User(list[i]["id"],list[i]["ModelUser"]);
    //  user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(User user) async {
    var dbClient = await database;

    int res =
    await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(User user) async {
    var dbClient = await database;




    int res =   await dbClient.update("User", user.toMap(),
        where: "id = ?", whereArgs: <String>[user.id]);



    return res > 0 ? true : false;
  }
}
