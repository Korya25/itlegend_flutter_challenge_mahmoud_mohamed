import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/datasource/offers_dao.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

abstract class SubCategoriesRepository {
  Future<List<SubCategoryModel>> getAllSubCategories();
}

class SubCategoriesRepositoryImpl implements SubCategoriesRepository {
  late final OffersDao _offersDao;

  SubCategoriesRepositoryImpl() {
    _initDao();
  }

  Future<void> _initDao() async {
    final db = await DatabaseHelper().database;
    _offersDao = OffersDao(db);
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    await _initDao();
    return await _offersDao.getAllSubCategories();
  }
}
