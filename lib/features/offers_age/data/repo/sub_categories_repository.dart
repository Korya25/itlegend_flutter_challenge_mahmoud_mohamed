import 'package:itlegend_flutter_challenge/features/offers_age/data/datasources/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

class SubCategoriesRepository {
  final DatabaseHelper _dbHelper;

  SubCategoriesRepository(this._dbHelper);

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    return await _dbHelper.getAllSubCategories();
  }
}
