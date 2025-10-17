import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

abstract class PlansRepository {
  Future<List<PlanModel>> getAllPlans();
}

class PlansRepositoryImpl implements PlansRepository {
  final DatabaseHelper _dbHelper;

  PlansRepositoryImpl(this._dbHelper);

  @override
  Future<List<PlanModel>> getAllPlans() async {
    return await _dbHelper.getAllPlans();
  }
}
