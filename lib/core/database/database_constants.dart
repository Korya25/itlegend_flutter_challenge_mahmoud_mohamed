class DatabaseConstants {
  // Paths
  static const String dbName = 'app_database.db';
  static const int dbVersion = 1;

  // Tables
  static const String categoriesTable = 'categories';
  static const String productsTable = 'products';
  static const String promoBannersTable = 'promo_banners';
  static const String subCategoriesTable = 'sub_categories';
  static const String plansTable = 'plans';
  static const String planDetailsTable = 'plan_details';

  // Common
  static const String idColumn = 'id';
  static const String nameColumn = 'name';
  static const String titleColumn = 'title';
  static const String subtitleColumn = 'subtitle';
  static const String imageUrlColumn = 'image_url';
  static const String imagePathColumn = 'image_path';
  static const String svgPathColumn = 'svg_path';
  static const String subTitleColumn = 'sub_title';
  static const String planIdColumn = 'plan_id';
  static const String categoryIdColumn = 'category_id';

  // Offers
  static const String originalPriceColumn = 'original_price';
  static const String discountedPriceColumn = 'discounted_price';
  static const String soldColumn = 'sold';

  // Plans
  static const String priceColumn = 'price';
  static const String badgeTextColumn = 'badge_text';
  static const String viewsCountColumn = 'views_count';
}
