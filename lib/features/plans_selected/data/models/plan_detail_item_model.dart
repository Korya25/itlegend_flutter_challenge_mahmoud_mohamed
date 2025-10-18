class PlanDetailItemModel {
  final String title;
  final String svgPath;
  final String? subTitle;

  const PlanDetailItemModel({
    required this.title,
    required this.svgPath,
    this.subTitle,
  });
}
