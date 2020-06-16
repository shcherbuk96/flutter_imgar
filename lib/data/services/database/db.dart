import 'dart:async';

import 'package:imgar/data/models/db_item.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;
  static String nameTable = "Terminator";
  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'imgar';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static Database getDB() {
    return _db;
  }

  static void onCreate(Database db, int version) async => await db.execute(
      'CREATE TABLE $nameTable (id INTEGER PRIMARY KEY NOT NULL, title STRING, image STRING)');

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, TitleItem model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, TitleItem model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, TitleItem model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static void onDispoce() {
    _db.close();
  }
}
