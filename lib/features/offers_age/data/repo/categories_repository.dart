import 'package:itlegend_flutter_challenge/features/offers_age/data/datasources/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';

class CategoriesRepository {
  final DatabaseHelper _dbHelper;

  CategoriesRepository(this._dbHelper);

  Future<List<OfferCategoryModel>> getAllCategories() async {
    return await _dbHelper.getAllCategories();
  }
}
