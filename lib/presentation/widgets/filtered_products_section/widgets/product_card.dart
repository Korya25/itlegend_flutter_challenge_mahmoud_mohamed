import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_card_info.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/filtered_products_section/widgets/product_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xffdbdbdd), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(imageUrl: product.imageUrl),
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 12,
                      bottom: 8,
                    ),
                    child: ProductCardInfo(product: product),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
