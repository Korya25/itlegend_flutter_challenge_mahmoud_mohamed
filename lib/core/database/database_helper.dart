// lib/core/database/database_helper.dart

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';
import '../../features/offers_age/data/datasource/offers_tables.dart';
import '../../features/plans_selected/data/datasource/plans_tables.dart';
import '../../features/offers_age/data/datasource/offers_seeder.dart';
import '../../features/plans_selected/data/datasource/plans_seeder.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), DatabaseConstants.dbName);
    return await openDatabase(
      path,
      version: DatabaseConstants.dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    try {
      await createOffersTables(db);
      await createPlansTables(db);
      await seedOffersData(db);
      await seedPlansData(db);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {}
  }

  // Close Database
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
