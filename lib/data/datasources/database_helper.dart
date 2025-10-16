import 'dart:async';
import 'package:itlegend_flutter_challenge/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/data/models/sub_category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create categories table
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    // Create products table
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_url TEXT NOT NULL,
        original_price REAL NOT NULL,
        discounted_price REAL NOT NULL,
        sold REAL NOT NULL,
        category_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');

    // Create promo_banners table
    await db.execute('''
      CREATE TABLE promo_banners(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT NOT NULL
      )
    ''');

    // Create sub_categories table
    await db.execute('''
      CREATE TABLE sub_categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_path TEXT NOT NULL
      )
    ''');

    // Seed initial data
    await _seedCategories(db);
    await _seedProducts(db);
    await _seedPromoBanners(db);
    await _seedSubCategories(db);
  }

  // Seed Categories
  Future<void> _seedCategories(Database db) async {
    final categories = OfferCategoryModel.categories;
    for (var category in categories) {
      await db.insert('categories', {'name': category.name});
    }
  }

  // Seed Products (assuming category_id for 'كل العروض' as 1)
  Future<void> _seedProducts(Database db) async {
    final products = ProductMockData.products;
    for (var product in products) {
      await db.insert('products', {
        'name': product.name,
        'image_url': product.imageUrl,
        'original_price': product.originalPrice.toDouble(),
        'discounted_price': product.discountedPrice.toDouble(),
        'sold': product.sold.toDouble(),
        'category_id': 1, // Default to first category
      });
    }
  }

  // Seed Promo Banners
  Future<void> _seedPromoBanners(Database db) async {
    final banners = PromoBannerModel.banners;
    for (var banner in banners) {
      await db.insert('promo_banners', {
        'title': banner.title,
        'subtitle': banner.subtitle,
      });
    }
  }

  // Seed Sub Categories
  Future<void> _seedSubCategories(Database db) async {
    final subCategories = SubCategoryModel.list;
    for (var subCategory in subCategories) {
      await db.insert('sub_categories', {
        'name': subCategory.name,
        'image_path': subCategory.imagePath,
      });
    }
  }

  // Get all categories
  Future<List<OfferCategoryModel>> getAllCategories() async {
    final db = await database;
    final maps = await db.query('categories');
    return List.generate(maps.length, (i) {
      return OfferCategoryModel(name: maps[i]['name'] as String);
    });
  }

  // Get all products
  Future<List<ProductModel>> getAllProducts() async {
    final db = await database;
    final maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'].toString(),
        name: maps[i]['name'] as String,
        imageUrl: maps[i]['image_url'] as String,
        originalPrice: maps[i]['original_price'] as num,
        discountedPrice: maps[i]['discounted_price'] as num,
        sold: maps[i]['sold'] as num,
      );
    });
  }

  // Get all promo banners
  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    final db = await database;
    final maps = await db.query('promo_banners');
    return List.generate(maps.length, (i) {
      return PromoBannerModel(
        title: maps[i]['title'] as String,
        subtitle: maps[i]['subtitle'] as String,
      );
    });
  }

  // Get all sub categories
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    final db = await database;
    final maps = await db.query('sub_categories');
    return List.generate(maps.length, (i) {
      return SubCategoryModel(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        imagePath: maps[i]['image_path'] as String,
      );
    });
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
