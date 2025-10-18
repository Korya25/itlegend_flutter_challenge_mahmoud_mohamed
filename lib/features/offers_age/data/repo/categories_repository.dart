import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/datasource/offers_dao.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';

abstract class CategoriesRepository {
  Future<List<OfferCategoryModel>> getAllCategories();
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  late final OffersDao _offersDao;

  CategoriesRepositoryImpl() {
    _initDao();
  }

  Future<void> _initDao() async {
    final db = await DatabaseHelper().database;
    _offersDao = OffersDao(db);
  }

  @override
  Future<List<OfferCategoryModel>> getAllCategories() async {
    await _initDao(); // Ensure initialized
    return await _offersDao.getAllCategories();
  }
}
