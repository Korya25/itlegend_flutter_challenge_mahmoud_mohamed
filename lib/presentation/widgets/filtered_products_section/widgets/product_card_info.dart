import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_bottom_actions.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_name.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_price.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_sold_info.dart';

class ProductCardInfo extends StatelessWidget {
  const ProductCardInfo({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ProductName(name: product.name),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: ProductPrices(product: product),
            ),
            ProductSoldInfo(sold: product.sold),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(top: 0),
          child: ProductBottomActions(),
        ),
      ],
    );
  }
}
