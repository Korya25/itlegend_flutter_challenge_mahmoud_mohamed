// lib/core/database/plans_tables.dart

import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';

Future<void> createPlansTables(Database db) async {
  await db.execute('''
    CREATE TABLE ${DatabaseConstants.plansTable}(
      ${DatabaseConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.nameColumn} TEXT NOT NULL,
      ${DatabaseConstants.priceColumn} REAL NOT NULL,
      ${DatabaseConstants.badgeTextColumn} TEXT,
      ${DatabaseConstants.viewsCountColumn} INTEGER
    )
  ''');

  await db.execute('''
    CREATE TABLE ${DatabaseConstants.planDetailsTable}(
      ${DatabaseConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.planIdColumn} INTEGER NOT NULL,
      ${DatabaseConstants.titleColumn} TEXT NOT NULL,
      ${DatabaseConstants.svgPathColumn} TEXT NOT NULL,
      ${DatabaseConstants.subTitleColumn} TEXT,
      FOREIGN KEY (${DatabaseConstants.planIdColumn}) REFERENCES ${DatabaseConstants.plansTable} (${DatabaseConstants.idColumn}) ON DELETE CASCADE
    )
  ''');
}
