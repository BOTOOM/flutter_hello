import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/model/todo.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblTodo = 'todo';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDB();
    }
    return _db;
  }

  Future<Database> initializeDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todos.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    var sql =
        'CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)';
    await db.execute(sql);
  }

  Future<int> insetTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    var sql = 'SELECT * FROM $tblTodo ORDER BY $colPriority ASC';
    var result = await db.rawQuery(sql);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT (*) FROM $tblTodo'));
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(),
        where: '$colId = ?', whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete('DELETE FROM $tblTodo WHERE $colId = $id');
    return result;
  }
}
