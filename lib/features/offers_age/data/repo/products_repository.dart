import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/datasource/offers_dao.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getAllProducts();
}

class ProductsRepositoryImpl implements ProductsRepository {
  late final OffersDao _offersDao;

  ProductsRepositoryImpl() {
    _initDao();
  }

  Future<void> _initDao() async {
    final db = await DatabaseHelper().database;
    _offersDao = OffersDao(db);
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    await _initDao();
    return await _offersDao.getAllProducts();
  }
}
