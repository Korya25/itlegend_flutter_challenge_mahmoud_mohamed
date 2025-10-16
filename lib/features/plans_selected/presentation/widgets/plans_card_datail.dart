import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_detail_item_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/number_of_views_container.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_dateail_item.dart';

class PlansCardDateail extends StatelessWidget {
  const PlansCardDateail({
    super.key,
    required this.planDetailItemList,
    this.viewsCount,
  });

  final List<PlanDetailItemModel> planDetailItemList;
  final int? viewsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (viewsCount != null) NumberOfViewsContainer(viewsCount: viewsCount!),
        if (viewsCount == null) SizedBox(width: 0, height: 0),

        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: planDetailItemList
              .map(
                (item) => PlansCardDateailItem(
                  title: item.title,
                  subTitle: item.subTitle,
                  svgPath: item.svgPath,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
