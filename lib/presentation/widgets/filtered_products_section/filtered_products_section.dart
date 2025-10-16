import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_state.dart';
import 'widgets/product_card.dart';

class FilteredProductsSection extends StatelessWidget {
  final List<ProductModel> products;
  const FilteredProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    if (state is! HomeLoaded) {
      return SliverToBoxAdapter(child: const SizedBox());
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 385,
          crossAxisSpacing: 8,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return ProductCard(product: products[index]);
        }, childCount: products.length),
      ),
    );
  }
}
