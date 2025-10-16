import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/core/utils/context_exstions.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_title_check_box.dart';

class PlansCardHeader extends StatelessWidget {
  const PlansCardHeader({super.key, required this.price, required this.name});
  final num price;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              'م',
              style: AppTextStyles.font16Bold().copyWith(
                color: AppColors.textAndIconOrange,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textAndIconOrange,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                ' .',
                style: AppTextStyles.font16Bold().copyWith(
                  color: AppColors.textAndIconOrange,
                  height: 1.0,
                ),
              ),
            ),

            Text(
              'ج',
              style: AppTextStyles.font16Bold().copyWith(
                color: AppColors.textAndIconOrange,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textAndIconOrange,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                price.formattedPrice,
                style: AppTextStyles.font16Bold().copyWith(
                  color: AppColors.textAndIconOrange,
                  height: 1.0,
                ),
              ),
            ),
          ],
        ),
        PlansCardTitleCheckBox(name: name),
      ],
    );
  }
}
