import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/core/presentation/widgets/error_retry_widget.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/controller/home_state.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/widgets/filtered_products_section/filtered_products_section.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/widgets/offer_categories/offer_categories_section.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/widgets/popular_sub_categories/popular_sub_categories_section.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/widgets/promotional_banner_section/promotional_banner_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backPrimary,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return ErrorRetryWidget(
              message: state.message,
              onRetry: () {
                context.read<HomeCubit>().loadData();
              },
            );
          }

          if (state is! HomeLoaded) {
            return const SizedBox();
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: OfferCategoriesSection(categories: state.categories),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 33),
                  child: PopularSubCategoriesSection(
                    subCategories: state.subCategories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: PromotionalBannerSection(
                    promoBanners: state.promoBanners,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              FilteredProductsSection(products: state.products),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
        },
      ),
    );
  }
}
