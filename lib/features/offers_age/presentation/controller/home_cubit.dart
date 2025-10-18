import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/categories_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/products_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/promo_banners_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/sub_categories_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoriesRepository _categoriesRepo;
  final ProductsRepository _productsRepo;
  final PromoBannersRepository _promoBannersRepo;
  final SubCategoriesRepository _subCategoriesRepo;

  HomeCubit(
    this._categoriesRepo,
    this._productsRepo,
    this._promoBannersRepo,
    this._subCategoriesRepo,
  ) : super(const HomeInitial());

  Future<void> loadData() async {
    emit(const HomeLoading());
    try {
      final categories = await _categoriesRepo.getAllCategories();
      final products = await _productsRepo.getAllProducts();
      final promoBanners = await _promoBannersRepo.getAllPromoBanners();
      final subCategories = await _subCategoriesRepo.getAllSubCategories();
      emit(
        HomeLoaded(
          categories: categories,
          products: products,
          promoBanners: promoBanners,
          subCategories: subCategories,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
