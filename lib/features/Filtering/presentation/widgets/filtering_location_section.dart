// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart'; // عدل المسار حسب مشروعك

class FilteringLocationSection extends StatelessWidget {
  const FilteringLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.arrowLeft),

        Row(
          spacing: 12,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الموقع',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.font14MeduimPrimary(),
                ),
                Text(
                  'مصر',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.font12RegularGrey(),
                ),
              ],
            ),

            SvgPicture.asset(
              AppAssets.location,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.textAndIconPrimary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
