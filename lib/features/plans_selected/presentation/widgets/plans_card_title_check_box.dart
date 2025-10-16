import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class PlansCardTitleCheckBox extends StatefulWidget {
  const PlansCardTitleCheckBox({super.key});

  @override
  State<PlansCardTitleCheckBox> createState() => _PlansCardTitleCheckBoxState();
}

class _PlansCardTitleCheckBoxState extends State<PlansCardTitleCheckBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'أساسية',
          style: AppTextStyles.font16Bold().copyWith(
            color: isSelected
                ? AppColors.primary
                : AppColors.textAndIconPrimary,
          ),
        ),
        GestureDetector(
          onTap: () {
            isSelected = !isSelected;
            setState(() {});
          },
          child: SvgPicture.asset(
            isSelected ? AppAssets.checbkoxActive : AppAssets.checbkoxDisable,
          ),
        ),
      ],
    );
  }
}
