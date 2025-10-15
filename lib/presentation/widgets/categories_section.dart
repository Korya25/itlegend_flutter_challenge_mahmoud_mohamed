import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';
import 'package:itlegend_flutter_challenge/data/models/category_model.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/see_all_button.dart';

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
        const _Header(),
        const SizedBox(height: 12),
        _CategoryList(
          categories: categories,
          selectedIndex: selectedIndex,
          onSelect: (index) {
            setState(() => selectedIndex = index);
          },
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('أستكشف العروض', style: AppTextStyles.font16PrimaryMeduim()),
          const SeeAllButton(),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final List<OfferCategoryModel> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _CategoryList({
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
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelect(index),
            child: OfferCategoryChip(
              name: categories[index].name,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

class OfferCategoryChip extends StatelessWidget {
  final String name;
  final bool isSelected;

  const OfferCategoryChip({
    super.key,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? const Color(0x0CF95B1C)
        : Colors.white.withOpacity(0.3);

    final borderColor = isSelected
        ? const Color(0x193B4CF2)
        : Colors.black.withOpacity(0.1);

    final textColor = isSelected
        ? const Color(0xFFF95B1C)
        : const Color(0x7F090F1F);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: AppTextStyles.custom(
            size: 14,
            color: textColor,
            weight: FontWeightHelper.medium,
          ),
        ),
      ),
    );
  }
}
