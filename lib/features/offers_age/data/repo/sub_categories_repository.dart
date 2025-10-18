import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/datasource/offers_dao.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

abstract class SubCategoriesRepository {
  Future<List<SubCategoryModel>> getAllSubCategories();
}

class SubCategoriesRepositoryImpl implements SubCategoriesRepository {
  OffersDao? _offersDao;

  SubCategoriesRepositoryImpl();

  Future<OffersDao> _getDao() async {
    _offersDao ??= OffersDao(await DatabaseHelper().database);
    return _offersDao!;
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    final dao = await _getDao();
    return await dao.getAllSubCategories();
  }
}
