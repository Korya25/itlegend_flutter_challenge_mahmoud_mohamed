import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/sub_category_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<OfferCategoryModel> categories;
  final List<ProductModel> products;
  final List<PromoBannerModel> promoBanners;
  final List<SubCategoryModel> subCategories;

  const HomeLoaded({
    required this.categories,
    required this.products,
    required this.promoBanners,
    required this.subCategories,
  });
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}
