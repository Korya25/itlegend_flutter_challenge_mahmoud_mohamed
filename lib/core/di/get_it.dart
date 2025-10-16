import 'package:get_it/get_it.dart';
import 'package:itlegend_flutter_challenge/data/datasources/database_helper.dart';
import 'package:itlegend_flutter_challenge/data/repo/categories_repository.dart';
import 'package:itlegend_flutter_challenge/data/repo/products_repository.dart';
import 'package:itlegend_flutter_challenge/data/repo/promo_banners_repository.dart';
import 'package:itlegend_flutter_challenge/data/repo/sub_categories_repository.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initGetIt() async {
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepository(sl<DatabaseHelper>()),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(sl<DatabaseHelper>()),
  );
  sl.registerLazySingleton<PromoBannersRepository>(
    () => PromoBannersRepository(sl<DatabaseHelper>()),
  );
  sl.registerLazySingleton<SubCategoriesRepository>(
    () => SubCategoriesRepository(sl<DatabaseHelper>()),
  );

  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl<CategoriesRepository>(),
      sl<ProductsRepository>(),
      sl<PromoBannersRepository>(),
      sl<SubCategoriesRepository>(),
    ),
  );
}
