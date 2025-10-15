import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_card.dart';

class FilteredProductsSection extends StatelessWidget {
  const FilteredProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = ProductMockData.products;

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
