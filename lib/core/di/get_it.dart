import 'package:get_it/get_it.dart';
import 'package:itlegend_flutter_challenge/core/database/database_helper.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/categories_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/products_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/promo_banners_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/repo/sub_categories_repository.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/repo/plans_repository.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/controller/plans_cubit.dart';

final sl = GetIt.instance;

Future<void> initGetIt() async {
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // Offers
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(),
  );
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl());
  sl.registerLazySingleton<PromoBannersRepository>(
    () => PromoBannersRepositoryImpl(),
  );
  sl.registerLazySingleton<SubCategoriesRepository>(
    () => SubCategoriesRepositoryImpl(),
  );

  // Plans
  sl.registerLazySingleton<PlansRepository>(() => PlansRepositoryImpl());

  // Cubits
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl<CategoriesRepository>(),
      sl<ProductsRepository>(),
      sl<PromoBannersRepository>(),
      sl<SubCategoriesRepository>(),
    ),
  );

  sl.registerFactory<PlansCubit>(() => PlansCubit(sl<PlansRepository>()));
}
