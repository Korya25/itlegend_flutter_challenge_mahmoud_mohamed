class PromoBannerModel {
  final String title;
  final String subtitle;

  PromoBannerModel({required this.title, required this.subtitle});

  static List<PromoBannerModel> banners = [
    PromoBannerModel(title: 'شحن مجانى', subtitle: 'لأى عرض تطلبه دلوقتى!'),
  ];
}
