import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_detail_item_model.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/number_of_views_container.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_dateail_item.dart';

class PlansCardDateail extends StatelessWidget {
  const PlansCardDateail({super.key});

  // ✅ هنا بنحط كل البيانات في قائمة واحدة
  List<PlanDetailItemModel> get _planItems => const [
    PlanDetailItemModel(
      title: 'صلاحية الإعلان 30 يوم',
      svgPath: AppAssets.watch,
    ),
    PlanDetailItemModel(
      title: 'رفع لأعلى القائمة كل 2 يوم',
      svgPath: AppAssets.rocket,
    ),
    PlanDetailItemModel(
      title: 'تثبيت فى مقاول صحى',
      subTitle: 'خلال ال48 ساعة القادمة',
      svgPath: AppAssets.pin,
    ),
    PlanDetailItemModel(
      title: 'ظهور فى كل محافظات مصر',
      svgPath: AppAssets.globel,
    ),
    PlanDetailItemModel(
      title: 'إعلان مميز',
      svgPath: AppAssets.workspacePremium,
    ),
    PlanDetailItemModel(
      title: 'تثبيت فى مقاول صحى فى الجهراء',
      svgPath: AppAssets.pin,
    ),
    PlanDetailItemModel(
      title: 'تثبيت فى مقاول صحى',
      subTitle: 'خلال ال48 ساعة القادمة',
      svgPath: AppAssets.pin,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ PlansCardNumberOfViews
        const NumberOfViewsContainer(),

        // ✅ items List
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _planItems
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
