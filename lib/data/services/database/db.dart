import 'dart:async';

import 'package:imgar/data/models/about_film_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database db;
  static String nameTable;
  static int get _version => 1;

  static Future<void> init() async {
    if (db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'imgar';
      db = await openDatabase(_path, version: _version);
      createTable(nameTable);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async => await db.execute(
      'CREATE TABLE IF NOT EXISTS $nameTable (id STRING PRIMARY KEY, titleType STRING, title STRING, imageUrl STRING, description STRING, length STRING, yearr STRING, rate STRING, episodes STRING, startSeason STRING, endSeason STRING)');

  static void createTable(String name) async => await db.execute(
      'CREATE TABLE IF NOT EXISTS $name (id STRING PRIMARY KEY, titleType STRING, title STRING, imageUrl STRING, description STRING, length STRING, yearr STRING, rate STRING, episodes STRING, startSeason STRING, endSeason STRING)');

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      db.query(table);

  static Future<int> insert(String table, AboutFilm model) async =>
      await db.insert(table, model.toMap());

  static Future<int> update(String table, AboutFilm model) async => await db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, AboutFilm model) async =>
      await db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static void onDispoce() {
    db.close();
  }
}
