import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class NumberOfViewsContainer extends StatelessWidget {
  const NumberOfViewsContainer({super.key, required this.viewsCount});
  final int viewsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Container(
          width: 71,
          height: 42,
          decoration: BoxDecoration(
            color: Color(0x0C3A813F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            border: Border(
              left: BorderSide(width: 1, color: AppColors.textAndIconGreen),
              top: BorderSide(width: 1, color: AppColors.textAndIconGreen),
              right: BorderSide(width: 1, color: AppColors.textAndIconGreen),
              bottom: BorderSide(
                width: 0.0000000000000000000001,
                color: AppColors.textAndIconGreen,
              ),
            ),
          ),

          child: Center(
            child: Text(
              viewsCount.toString(),
              style: AppTextStyles.font14BoldGreen(),
            ),
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            'ضعف عدد المشاهدات',
            style: AppTextStyles.font12RegularPrimary().copyWith(
              decoration: TextDecoration.underline,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
