// lib/core/database/offers_seeder.dart

import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

Future<void> seedOffersData(Database db) async {
  await _seedCategories(db);
  await _seedProducts(db);
  await _seedPromoBanners(db);
  await _seedSubCategories(db);
}

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
