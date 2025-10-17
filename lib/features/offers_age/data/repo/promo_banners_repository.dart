import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';

abstract class PromoBannersRepository {
  Future<List<PromoBannerModel>> getAllPromoBanners();
}

class PromoBannersRepositoryImpl implements PromoBannersRepository {
  final DatabaseHelper _dbHelper;

  PromoBannersRepositoryImpl(this._dbHelper);

  @override
  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    return await _dbHelper.getAllPromoBanners();
  }
}
