// lib/core/database/plans_dao.dart

import 'package:sqflite/sqflite.dart';
import 'package:itlegend_flutter_challenge/core/database/database_constants.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_detail_item_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

class PlansDao {
  final Database _db;

  PlansDao(this._db);

  Future<List<PlanModel>> getAllPlans() async {
    try {
      final planMaps = await _db.query(DatabaseConstants.plansTable);
      final plans = <PlanModel>[];

      for (var planMap in planMaps) {
        final planId = planMap[DatabaseConstants.idColumn] as int;
        final detailMaps = await _db.query(
          DatabaseConstants.planDetailsTable,
          where: '${DatabaseConstants.planIdColumn} = ?',
          whereArgs: [planId],
        );

        final details = List.generate(detailMaps.length, (i) {
          return PlanDetailItemModel(
            title: detailMaps[i][DatabaseConstants.titleColumn] as String,
            svgPath: detailMaps[i][DatabaseConstants.svgPathColumn] as String,
            subTitle:
                detailMaps[i][DatabaseConstants.subTitleColumn] as String?,
          );
        });

        plans.add(
          PlanModel(
            name: planMap[DatabaseConstants.nameColumn] as String,
            price: planMap[DatabaseConstants.priceColumn] as num,
            badgeText: planMap[DatabaseConstants.badgeTextColumn] as String?,
            viewsCount: planMap[DatabaseConstants.viewsCountColumn] as int?,
            details: details,
          ),
        );
      }

      return plans;
    } catch (e) {
      return [];
    }
  }
}
