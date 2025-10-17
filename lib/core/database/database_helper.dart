// lib/features/offers_age/data/datasources/database_helper.dart (Merged and Refactored)
// ignore_for_file: avoid_print

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_detail_item_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

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
      await _createOffersTables(db);
      await _createPlansTables(db);
      await _seedAllData(db);
      print('Database created and seeded successfully!');
    } catch (e) {
      print('Error creating DB: $e');
      rethrow;
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {}
  }

  // Create Offers
  Future<void> _createOffersTables(Database db) async {
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

  // Create Plans
  Future<void> _createPlansTables(Database db) async {
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

  // Seed All Data
  Future<void> _seedAllData(Database db) async {
    await _seedCategories(db);
    await _seedProducts(db);
    await _seedPromoBanners(db);
    await _seedSubCategories(db);
    await _seedPlans(db);
  }

  // Seed Offers
  Future<void> _seedCategories(Database db) async {
    final categories = OfferCategoryModel.categories;
    for (var category in categories) {
      await db.insert(DatabaseConstants.categoriesTable, {
        DatabaseConstants.nameColumn: category.name,
      });
    }
  }

  Future<void> _seedProducts(Database db) async {
    final products = ProductMockData.products;
    for (var product in products) {
      await db.insert(DatabaseConstants.productsTable, {
        DatabaseConstants.nameColumn: product.name,
        DatabaseConstants.imageUrlColumn: product.imageUrl,
        DatabaseConstants.originalPriceColumn: product.originalPrice.toDouble(),
        DatabaseConstants.discountedPriceColumn: product.discountedPrice
            .toDouble(),
        DatabaseConstants.soldColumn: product.sold.toDouble(),
        DatabaseConstants.categoryIdColumn: 1,
      });
    }
  }

  Future<void> _seedPromoBanners(Database db) async {
    final banners = PromoBannerModel.banners;
    for (var banner in banners) {
      await db.insert(DatabaseConstants.promoBannersTable, {
        DatabaseConstants.titleColumn: banner.title,
        DatabaseConstants.subtitleColumn: banner.subtitle,
      });
    }
  }

  Future<void> _seedSubCategories(Database db) async {
    final subCategories = SubCategoryModel.list;
    for (var subCategory in subCategories) {
      await db.insert(DatabaseConstants.subCategoriesTable, {
        DatabaseConstants.nameColumn: subCategory.name,
        DatabaseConstants.imagePathColumn: subCategory.imagePath,
      });
    }
  }

  Future<void> _seedPlans(Database db) async {
    final plans = PlanModel.samplePlans;
    for (var plan in plans) {
      final planId = await db.insert(DatabaseConstants.plansTable, {
        DatabaseConstants.nameColumn: plan.name,
        DatabaseConstants.priceColumn: plan.price.toDouble(),
        DatabaseConstants.badgeTextColumn: plan.badgeText,
        DatabaseConstants.viewsCountColumn: plan.viewsCount,
      });

      for (var detail in plan.details) {
        await db.insert(DatabaseConstants.planDetailsTable, {
          DatabaseConstants.planIdColumn: planId,
          DatabaseConstants.titleColumn: detail.title,
          DatabaseConstants.svgPathColumn: detail.svgPath,
          DatabaseConstants.subTitleColumn: detail.subTitle,
        });
      }
    }
  }

  // Get  Offers
  Future<List<OfferCategoryModel>> getAllCategories() async {
    try {
      final db = await database;
      final maps = await db.query(DatabaseConstants.categoriesTable);
      return List.generate(maps.length, (i) {
        return OfferCategoryModel(
          name: maps[i][DatabaseConstants.nameColumn] as String,
        );
      });
    } catch (e) {
      print('Error fetching categories: $e');
      rethrow;
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final db = await database;
      final maps = await db.query(DatabaseConstants.productsTable);
      return List.generate(maps.length, (i) {
        return ProductModel(
          id: maps[i][DatabaseConstants.idColumn].toString(),
          name: maps[i][DatabaseConstants.nameColumn] as String,
          imageUrl: maps[i][DatabaseConstants.imageUrlColumn] as String,
          originalPrice: maps[i][DatabaseConstants.originalPriceColumn] as num,
          discountedPrice:
              maps[i][DatabaseConstants.discountedPriceColumn] as num,
          sold: maps[i][DatabaseConstants.soldColumn] as num,
        );
      });
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }

  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    try {
      final db = await database;
      final maps = await db.query(DatabaseConstants.promoBannersTable);
      return List.generate(maps.length, (i) {
        return PromoBannerModel(
          title: maps[i][DatabaseConstants.titleColumn] as String,
          subtitle: maps[i][DatabaseConstants.subtitleColumn] as String,
        );
      });
    } catch (e) {
      print('Error fetching promo banners: $e');
      rethrow;
    }
  }

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    try {
      final db = await database;
      final maps = await db.query(DatabaseConstants.subCategoriesTable);
      return List.generate(maps.length, (i) {
        return SubCategoryModel(
          id: maps[i][DatabaseConstants.idColumn] as int,
          name: maps[i][DatabaseConstants.nameColumn] as String,
          imagePath: maps[i][DatabaseConstants.imagePathColumn] as String,
        );
      });
    } catch (e) {
      print('Error fetching sub categories: $e');
      rethrow;
    }
  }

  // Get Plans
  Future<List<PlanModel>> getAllPlans() async {
    try {
      final db = await database;
      final planMaps = await db.query(DatabaseConstants.plansTable);
      final plans = <PlanModel>[];

      for (var planMap in planMaps) {
        final planId = planMap[DatabaseConstants.idColumn] as int;
        final detailMaps = await db.query(
          DatabaseConstants.planDetailsTable,
          where: '${DatabaseConstants.planIdColumn} = ?',
          whereArgs: [planId],
        );

        final details = List.generate(detailMaps.length, (i) {
          return PlanDetailItemModel(
            title: detailMaps[i][DatabaseConstants.titleColumn] as String,
            svgPath: detailMaps[i][DatabaseConstants.svgPathColumn] as String,
            subTitle:
                detailMaps[i][DatabaseConstants.subTitleColumn] as String?,
          );
        });

        plans.add(
          PlanModel(
            name: planMap[DatabaseConstants.nameColumn] as String,
            price: planMap[DatabaseConstants.priceColumn] as num,
            badgeText: planMap[DatabaseConstants.badgeTextColumn] as String?,
            viewsCount: planMap[DatabaseConstants.viewsCountColumn] as int?,
            details: details,
          ),
        );
      }

      return plans;
    } catch (e) {
      print('Error fetching plans: $e');
      rethrow;
    }
  }

  // Close Database
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
