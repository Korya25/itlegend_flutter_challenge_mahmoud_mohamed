// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_datail.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_header.dart';

class PlansCardBody extends StatelessWidget {
  const PlansCardBody({super.key, required this.plan});

  final PlanModel plan;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        // Header
        PlansCardHeader(price: plan.price, name: plan.name),

        // Devider
        Divider(color: Colors.black.withOpacity(0.1), thickness: 1),

        // Detail
        PlansCardDateail(
          viewsCount: plan.viewsCount,
          planDetailItemList: plan.details,
        ),
      ],
    );
  }
}
