import 'dart:async';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_detail_item_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PlansDatabaseHelper {
  static final PlansDatabaseHelper _instance = PlansDatabaseHelper._internal();
  factory PlansDatabaseHelper() => _instance;
  PlansDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'plans_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create plans table
    await db.execute('''
      CREATE TABLE plans(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        badge_text TEXT,
        views_count INTEGER
      )
    ''');

    // Create plan_details table
    await db.execute('''
      CREATE TABLE plan_details(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        plan_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        svg_path TEXT NOT NULL,
        sub_title TEXT,
        FOREIGN KEY (plan_id) REFERENCES plans (id)
      )
    ''');

    // Seed initial data
    await _seedPlans(db);
  }

  // Seed Plans
  Future<void> _seedPlans(Database db) async {
    final plans = PlanModel.samplePlans;
    for (var plan in plans) {
      final planId = await db.insert('plans', {
        'name': plan.name,
        'price': plan.price.toDouble(),
        'badge_text': plan.badgeText,
        'views_count': plan.viewsCount,
      });

      // Insert details for this plan
      for (var detail in plan.details) {
        await db.insert('plan_details', {
          'plan_id': planId,
          'title': detail.title,
          'svg_path': detail.svgPath,
          'sub_title': detail.subTitle,
        });
      }
    }
  }

  // Get all plans with details
  Future<List<PlanModel>> getAllPlans() async {
    final db = await database;
    final planMaps = await db.query('plans');
    final plans = <PlanModel>[];

    for (var planMap in planMaps) {
      final planId = planMap['id'] as int;
      final detailMaps = await db.query(
        'plan_details',
        where: 'plan_id = ?',
        whereArgs: [planId],
      );

      final details = List.generate(detailMaps.length, (i) {
        return PlanDetailItemModel(
          title: detailMaps[i]['title'] as String,
          svgPath: detailMaps[i]['svg_path'] as String,
          subTitle: detailMaps[i]['sub_title'] as String?,
        );
      });

      plans.add(
        PlanModel(
          name: planMap['name'] as String,
          price: planMap['price'] as num,
          badgeText: planMap['badge_text'] as String?,
          viewsCount: planMap['views_count'] as int?,
          details: details,
        ),
      );
    }

    return plans;
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
