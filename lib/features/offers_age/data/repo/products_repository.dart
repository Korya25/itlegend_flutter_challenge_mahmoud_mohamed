import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getAllProducts();
}

class ProductsRepositoryImpl implements ProductsRepository {
  final DatabaseHelper _dbHelper;

  ProductsRepositoryImpl(this._dbHelper);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return await _dbHelper.getAllProducts();
  }
}
