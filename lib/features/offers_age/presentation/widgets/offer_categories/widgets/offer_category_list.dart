import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/widgets/offer_categories/widgets/offer_category_chip.dart';

class OfferCategoryList extends StatelessWidget {
  final List<OfferCategoryModel> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const OfferCategoryList({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelect(index),
            child: OfferCategoryChip(
              name: category.name,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
