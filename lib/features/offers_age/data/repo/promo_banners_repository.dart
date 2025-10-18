import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/datasource/offers_dao.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';

abstract class PromoBannersRepository {
  Future<List<PromoBannerModel>> getAllPromoBanners();
}

class PromoBannersRepositoryImpl implements PromoBannersRepository {
  late final OffersDao _offersDao;

  PromoBannersRepositoryImpl() {
    _initDao();
  }

  Future<void> _initDao() async {
    final db = await DatabaseHelper().database;
    _offersDao = OffersDao(db);
  }

  @override
  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    await _initDao();
    return await _offersDao.getAllPromoBanners();
  }
}
