// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_body.dart';
import 'plan_offer_badge.dart';

class PlansCard extends StatelessWidget {
  const PlansCard({super.key, required this.plan});
  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: AppColors.backPrimary,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0A090F1F),
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: PlansCardBody(plan: plan),
        ),
        // Banner
        if (plan.badgeText != null)
          Positioned(
            right: 0,
            top: -20,
            child: Align(
              alignment: Alignment.centerRight,
              child: PlanOfferBadge(badgeText: plan.badgeText!),
            ),
          ),
      ],
    );
  }
}
