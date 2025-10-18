import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/datasource/plans_dao.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

abstract class PlansRepository {
  Future<List<PlanModel>> getAllPlans();
}

class PlansRepositoryImpl implements PlansRepository {
  late final PlansDao _plansDao;

  PlansRepositoryImpl() {
    _initDao();
  }

  Future<void> _initDao() async {
    final db = await DatabaseHelper().database;
    _plansDao = PlansDao(db);
  }

  @override
  Future<List<PlanModel>> getAllPlans() async {
    await _initDao();
    return await _plansDao.getAllPlans();
  }
}
