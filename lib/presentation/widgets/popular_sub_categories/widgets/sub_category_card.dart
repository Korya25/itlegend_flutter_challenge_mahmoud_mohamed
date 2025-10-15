// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/data/models/sub_category_model.dart';

class SubCategoryCard extends StatelessWidget {
  final SubCategoryModel subCategory;

  const SubCategoryCard({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(subCategory.imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subCategory.name,
          textAlign: TextAlign.center,
          style: AppTextStyles.font12RegularPrimary(),
          maxLines: 1,
        ),
      ],
    );
  }
}
