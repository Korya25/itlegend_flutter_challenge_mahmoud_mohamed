import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

abstract class SubCategoriesRepository {
  Future<List<SubCategoryModel>> getAllSubCategories();
}

class SubCategoriesRepositoryImpl implements SubCategoriesRepository {
  final DatabaseHelper _dbHelper;

  SubCategoriesRepositoryImpl(this._dbHelper);

  @override
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    return await _dbHelper.getAllSubCategories();
  }
}
