import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/data/models/offer_category_model.dart';
import 'widgets/offer_category_header.dart';
import 'widgets/offer_category_list.dart';

class OfferCategoriesSection extends StatefulWidget {
  const OfferCategoriesSection({super.key});

  @override
  State<OfferCategoriesSection> createState() => _OfferCategoriesSectionState();
}

class _OfferCategoriesSectionState extends State<OfferCategoriesSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final categories = OfferCategoryModel.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OfferCategoryHeader(),
        const SizedBox(height: 12),
        OfferCategoryList(
          categories: categories,
          selectedIndex: selectedIndex,
          onSelect: (index) => setState(() => selectedIndex = index),
        ),
      ],
    );
  }
}
