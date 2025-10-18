class OfferCategoryModel {
  final String name;

  OfferCategoryModel({required this.name});

  static List<OfferCategoryModel> categories = [
    OfferCategoryModel(name: 'كل العروض'),
    OfferCategoryModel(name: 'ملابس'),
    OfferCategoryModel(name: 'أكسسوارات'),
    OfferCategoryModel(name: 'الكترونيات'),
    OfferCategoryModel(name: 'منتجات تجميل'),
    OfferCategoryModel(name: 'عقارات'),
  ];
}
