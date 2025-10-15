import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/data/models/sub_category_model.dart';
import 'widgets/sub_category_card.dart';

class PopularSubCategoriesSection extends StatelessWidget {
  const PopularSubCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final subCategories = SubCategoryModel.list;

    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: subCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final subCategory = subCategories[index];
          return SubCategoryCard(subCategory: subCategory);
        },
      ),
    );
  }
}
