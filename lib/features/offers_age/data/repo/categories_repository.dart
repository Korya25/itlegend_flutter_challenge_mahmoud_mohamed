import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/datasource/offers_dao.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';

abstract class CategoriesRepository {
  Future<List<OfferCategoryModel>> getAllCategories();
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  OffersDao? _offersDao;

  Future<OffersDao> get _dao async {
    if (_offersDao == null) {
      final db = await DatabaseHelper().database;
      _offersDao = OffersDao(db);
    }
    return _offersDao!;
  }

  @override
  Future<List<OfferCategoryModel>> getAllCategories() async {
    final dao = await _dao;
    return dao.getAllCategories();
  }
}
