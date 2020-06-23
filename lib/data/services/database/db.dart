import 'dart:async';

import 'package:imgar/data/models/about_film_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DB {
  static final _databaseName = "imgarDB.db";
  static final _databaseVersion = 1;

  static String table;

  DB._();
  static final DB db = DB._();
  Database _database;

  Future<Database> get database async {
    print("database getter called");

    // if (_database != null) {
    //   return _database;
    // }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, _databaseName),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating table");

        await database.execute(
          "CREATE TABLE IF NOT EXISTS $table ("
          "id STRING PRIMARY KEY, titleType STRING, isTitleType INTEGER, title STRING, isTitle INTEGER, imageUrl STRING, isImageUrl INTEGER, description STRING, isDescription INTEGER, length STRING, isLength INTEGER, yearr STRING, isYearr INTEGER, rate STRING, isRate INTEGER, episodes STRING, isEpisodes INTEGER, startSeason STRING, isStartSeason INTEGER, endSeason STRING, isEndSeason INTEGER, trailerUrl STRING, isTrailer INTEGER"
          ")",
        );
      },
    );
  }

  // isExistTable(id) async{
  //   final db = await database;
  //   final res=db.rawQuery("SELECT * FROM sqlite_master WHERE type='$table'").then((value) => print(value.toString()));
  //   return res;
  // }

  Future<List<AboutFilm>> getFilms() async {
    final db = await database;

    var films = await db.query(table, columns: [
      "id",
      "titleType",
      "isTitleType",
      "title",
      "isTitle",
      "imageUrl",
      "isImageUrl",
      "description",
      "isDescription",
      "length",
      "isLength",
      "yearr",
      "isYearr",
      "rate",
      "isRate",
      "episodes",
      "isEpisodes",
      "startSeason",
      "isStartSeason",
      "endSeason",
      "isEndSeason",
      "trailerUrl",
      "isTrailer"
    ]);

    List<AboutFilm> movieList = List<AboutFilm>();

    films.forEach((obj) {
      AboutFilm food = AboutFilm.fromMap(obj);

      movieList.add(food);
    });
    db.close();
    return movieList;
  }

  insert(AboutFilm movie) async {
    final db = await database;
    await db.insert(table, movie.toMap());
  }

  dispose() async {
    final db = await database;
    db.close();
  }

  exist() async {
    final db = await database;
  }

  // static Future<void> init() async {
  //   if (db != null) {
  //     return;
  //   }

  //   try {
  //     String _path = await getDatabasesPath() + _databaseName;
  //     _db = await openDatabase(_path,
  //         version: _databaseVersion, onCreate: onCreate);
  //     createTable(_table);
  //   } catch (ex) {
  //     print(ex);
  //   }
  // }

  // static void onCreate(Database db, int version) async => await db.execute(
  //     'CREATE TABLE IF NOT EXISTS $_table (id STRING PRIMARY KEY, titleType STRING, title STRING, imageUrl STRING, description STRING, length STRING, yearr STRING, rate STRING, episodes STRING, startSeason STRING, endSeason STRING)');

  // static void createTable(String name) async => await db.execute(
  //     'CREATE TABLE IF NOT EXISTS $name (id STRING PRIMARY KEY, titleType STRING, title STRING, imageUrl STRING, description STRING, length STRING, yearr STRING, rate STRING, episodes STRING, startSeason STRING, endSeason STRING)');

  // static Future<List<Map<String, dynamic>>> query(String table) async =>
  //     db.query(table);

  // static Future<int> insert(String table, AboutFilm model) async =>
  //     await db.insert(table, model.toMap());

  // static Future<int> update(String table, AboutFilm model) async => await db
  //     .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  // static Future<int> delete(String table, AboutFilm model) async =>
  //     await db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  // static void onDispoce() {
  //   db.close();
  // }
}
