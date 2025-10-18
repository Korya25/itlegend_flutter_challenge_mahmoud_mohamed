// lib/core/database/offers_tables.dart

import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';

Future<void> createOffersTables(Database db) async {
  await db.execute('''
    CREATE TABLE ${DatabaseConstants.categoriesTable}(
      ${DatabaseConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.nameColumn} TEXT NOT NULL
    )
  ''');

  await db.execute('''
    CREATE TABLE ${DatabaseConstants.productsTable}(
      ${DatabaseConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.nameColumn} TEXT NOT NULL,
      ${DatabaseConstants.imageUrlColumn} TEXT NOT NULL,
      ${DatabaseConstants.originalPriceColumn} REAL NOT NULL,
      ${DatabaseConstants.discountedPriceColumn} REAL NOT NULL,
      ${DatabaseConstants.soldColumn} REAL NOT NULL,
      ${DatabaseConstants.categoryIdColumn} INTEGER,
      FOREIGN KEY (${DatabaseConstants.categoryIdColumn}) REFERENCES ${DatabaseConstants.categoriesTable} (${DatabaseConstants.idColumn}) ON DELETE CASCADE
    )
  ''');

  await db.execute('''
    CREATE TABLE ${DatabaseConstants.promoBannersTable}(
      ${DatabaseConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.titleColumn} TEXT NOT NULL,
      ${DatabaseConstants.subtitleColumn} TEXT NOT NULL
    )
  ''');

  await db.execute('''
    CREATE TABLE ${DatabaseConstants.subCategoriesTable}(
      ${DatabaseConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.nameColumn} TEXT NOT NULL,
      ${DatabaseConstants.imagePathColumn} TEXT NOT NULL
    )
  ''');
}
