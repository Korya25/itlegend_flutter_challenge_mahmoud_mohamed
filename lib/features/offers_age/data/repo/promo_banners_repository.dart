import 'package:itlegend_flutter_challenge/features/offers_age/data/datasources/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';

class PromoBannersRepository {
  final DatabaseHelper _dbHelper;

  PromoBannersRepository(this._dbHelper);

  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    return await _dbHelper.getAllPromoBanners();
  }
}
