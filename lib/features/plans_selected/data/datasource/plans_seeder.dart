import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

Future<void> seedPlansData(Database db) async {
  final plans = PlanModel.samplePlans;
  for (var plan in plans) {
    final planId = await db.insert(DatabaseConstants.plansTable, {
      DatabaseConstants.nameColumn: plan.name,
      DatabaseConstants.priceColumn: plan.price.toDouble(),
      DatabaseConstants.badgeTextColumn: plan.badgeText,
      DatabaseConstants.viewsCountColumn: plan.viewsCount,
    });

    for (var detail in plan.details) {
      await db.insert(DatabaseConstants.planDetailsTable, {
        DatabaseConstants.planIdColumn: planId,
        DatabaseConstants.titleColumn: detail.title,
        DatabaseConstants.svgPathColumn: detail.svgPath,
        DatabaseConstants.subTitleColumn: detail.subTitle,
      });
    }
  }
}
