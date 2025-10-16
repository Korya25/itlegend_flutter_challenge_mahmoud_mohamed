import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_view_header.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PlanModel> plans = PlanModel.samplePlans;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 30),
                  PlansViewHeader(),
                  SizedBox(height: 30),
                ],
              ),
            ),

            SliverList.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                final plan = plans[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: PlansCard(plan: plan),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
