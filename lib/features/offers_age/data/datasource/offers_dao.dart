// lib/core/database/offers_dao.dart

import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

class OffersDao {
  final Database _db;
  OffersDao(this._db);
  Future<List<OfferCategoryModel>> getAllCategories() async {
    try {
      final maps = await _db.query(DatabaseConstants.categoriesTable);
      return List.generate(maps.length, (i) {
        return OfferCategoryModel(
          name: maps[i][DatabaseConstants.nameColumn] as String,
        );
      });
    } catch (e) {
      return [];
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final maps = await _db.query(DatabaseConstants.productsTable);
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
      return [];
    }
  }

  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    try {
      final maps = await _db.query(DatabaseConstants.promoBannersTable);
      return List.generate(maps.length, (i) {
        return PromoBannerModel(
          title: maps[i][DatabaseConstants.titleColumn] as String,
          subtitle: maps[i][DatabaseConstants.subtitleColumn] as String,
        );
      });
    } catch (e) {
      return [];
    }
  }

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    try {
      final maps = await _db.query(DatabaseConstants.subCategoriesTable);
      return List.generate(maps.length, (i) {
        return SubCategoryModel(
          id: maps[i][DatabaseConstants.idColumn] as int,
          name: maps[i][DatabaseConstants.nameColumn] as String,
          imagePath: maps[i][DatabaseConstants.imagePathColumn] as String,
        );
      });
    } catch (e) {
      return [];
    }
  }
}
