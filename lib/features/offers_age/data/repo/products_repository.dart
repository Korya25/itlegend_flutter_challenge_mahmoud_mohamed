import 'package:itlegend_flutter_challenge/features/offers_age/data/datasources/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';

class ProductsRepository {
  final DatabaseHelper _dbHelper;

  ProductsRepository(this._dbHelper);

  Future<List<ProductModel>> getAllProducts() async {
    return await _dbHelper.getAllProducts();
  }
}
