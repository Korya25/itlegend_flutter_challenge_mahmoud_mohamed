import 'package:itlegend_flutter_challenge/features/plans_selected/data/data/database/plans_database_helper.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

abstract class PlansRepository {
  Future<List<PlanModel>> getAllPlans();
}

class PlansRepositoryImpl implements PlansRepository {
  final PlansDatabaseHelper _databaseHelper;

  PlansRepositoryImpl(this._databaseHelper);

  @override
  Future<List<PlanModel>> getAllPlans() async {
    try {
      return await _databaseHelper.getAllPlans();
    } catch (e) {
      rethrow;
    }
  }
}
