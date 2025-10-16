// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: isSelected
            ? AppColors.offerCategoriesCard
            : AppColors.backPrimary.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isSelected
                ? const Color(0x193B4CF2)
                : Colors.black.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: AppTextStyles.custom(
            size: 14,
            color: isSelected
                ? AppColors.textAndIconOrange
                : AppColors.textAndIconPrimary,
            weight: FontWeightHelper.medium,
          ),
        ),
      ),
    );
  }
}
