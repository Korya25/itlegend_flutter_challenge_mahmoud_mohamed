import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/datasource/plans_dao.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

abstract class PlansRepository {
  Future<List<PlanModel>> getAllPlans();
}

class PlansRepositoryImpl implements PlansRepository {
  PlansDao? _plansDao;

  Future<PlansDao> get _dao async {
    if (_plansDao == null) {
      final db = await DatabaseHelper().database;
      _plansDao = PlansDao(db);
    }
    return _plansDao!;
  }

  @override
  Future<List<PlanModel>> getAllPlans() async {
    final dao = await _dao;
    return dao.getAllPlans();
  }
}
