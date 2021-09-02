import 'dart:async';
import 'dart:io';
import 'package:english_words_app/models/words.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class SQL_Helper {
  static SQL_Helper? dbHelper;
  static Database? _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    if (dbHelper == null) {
      dbHelper = SQL_Helper._createInstance();
    }
    return dbHelper!;
  }

  String tableWords = "words_table";
  String _id = 'id';
  String _firstWord = 'firstWord';
  String _secondWord = 'secondWord';

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database!;
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    var wordDb = await openDatabase(path, version: 1, onCreate: createDatabase);
    return wordDb;
  }

  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableWords ($_id INTAGER PRIMARY KEY AUTOINCREMENT, $_firstWord TEXT, $_secondWord TEXT)");
  }

  Future<List<Map<String, dynamic>>> getWordMapList() async {
    Database db = await this.database;
    var result = await db.query(tableWords, orderBy: "$_id ASC");
    return result;
  }

  Future<int> insertWord(Words word) async {
    Database db = await this.database;
    var result = await db.insert(tableWords, word.toMap());
    return result;
  }

  Future<int> updateWord(Words word) async {
    Database db = await this.database;
    var result = await db.update(tableWords, word.toMap(),
        where: "$_id = ?", whereArgs: [word.id]);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> all =
        await db.rawQuery("SELECT COUNT (*) FROM $tableWords");
    int? result = Sqflite.firstIntValue(all);
    return result!;
  }
}
