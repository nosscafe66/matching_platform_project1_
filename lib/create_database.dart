import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

Future _onCreate(Database database, int version) async {
  await database.execute('''
    CREATE TABLE tasks (
      _id INTEGER PRIMARY KEY AUTOINCREMENT,
      name STRING NOT NULL,
      priority INTEGER NOT NULL,
      deadline STRING NOT NULL,
      memo STRING
    )
  ''');
}
