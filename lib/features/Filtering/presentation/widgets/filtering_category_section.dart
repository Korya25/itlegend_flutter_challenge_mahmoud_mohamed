// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class FilteringCategorySection extends StatelessWidget {
  const FilteringCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الفئة',
                style: AppTextStyles.font16PrimaryMeduim().copyWith(
                  color: AppColors.textAndIconGrey,
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('تغيير', style: AppTextStyles.font14BoldBlue()),
                    Row(
                      spacing: 10,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'عقارات',
                              style: AppTextStyles.font14MeduimPrimary(),
                            ),
                            Text(
                              'فلل البيع',
                              style: AppTextStyles.font12RegularPrimary()
                                  .copyWith(color: AppColors.textAndIconGrey),
                            ),
                          ],
                        ),
                        SvgPicture.asset(AppAssets.materialSymbols),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
