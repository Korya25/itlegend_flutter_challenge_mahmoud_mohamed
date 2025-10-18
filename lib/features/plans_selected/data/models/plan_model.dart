import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'plan_detail_item_model.dart';

class PlanModel {
  final String name;
  final num price;
  final String? badgeText;
  final int? viewsCount;
  final List<PlanDetailItemModel> details;

  const PlanModel({
    required this.name,
    required this.price,
    this.badgeText,
    this.viewsCount,
    required this.details,
  });

  static List<PlanModel> samplePlans = [
    PlanModel(
      name: 'أساسية',
      price: 3000,
      details: [
        PlanDetailItemModel(
          title: 'صلاحية الإعلان 30 يوم',
          svgPath: AppAssets.watch,
        ),
      ],
    ),
    PlanModel(
      name: 'أكسترا',
      price: 3000,
      viewsCount: 7,
      details: [
        PlanDetailItemModel(
          title: 'صلاحية الإعلان 30 يوم',
          svgPath: AppAssets.watch,
        ),
        PlanDetailItemModel(
          title: 'رفع لأعلى القائمة كل 3 أيام',
          svgPath: AppAssets.rocket,
        ),
        PlanDetailItemModel(
          title: 'تثبيت فى مقاول صحى',
          subTitle: 'خلال ال48 ساعة القادمة',
          svgPath: AppAssets.pin,
        ),
      ],
    ),
    PlanModel(
      name: 'بلس',
      price: 3000,
      badgeText: 'أفضل قيمة مقابل سعر',

      viewsCount: 18,
      details: [
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
          title: 'تثبيت فى مقاول صحى فى\n الجهراء',
          svgPath: AppAssets.pin,
        ),
        PlanDetailItemModel(
          title: 'تثبيت فى مقاول صحى',
          subTitle: 'خلال ال48 ساعة القادمة',
          svgPath: AppAssets.pin,
        ),
      ],
    ),
    PlanModel(
      name: 'سوبر',
      price: 3000,
      viewsCount: 24,
      badgeText: 'أعلى مشاهدات',
      details: [
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
          title: 'تثبيت فى مقاول صحى فى\n الجهراء',
          svgPath: AppAssets.pin,
        ),
        PlanDetailItemModel(
          title: 'تثبيت فى مقاول صحى',
          subTitle: 'خلال ال48 ساعة القادمة',
          svgPath: AppAssets.pin,
        ),
      ],
    ),
  ];
}
