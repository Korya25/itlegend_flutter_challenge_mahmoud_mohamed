import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';

abstract class CategoriesRepository {
  Future<List<OfferCategoryModel>> getAllCategories();
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  final DatabaseHelper _dbHelper;

  CategoriesRepositoryImpl(this._dbHelper);

  @override
  Future<List<OfferCategoryModel>> getAllCategories() async {
    return await _dbHelper.getAllCategories();
  }
}
