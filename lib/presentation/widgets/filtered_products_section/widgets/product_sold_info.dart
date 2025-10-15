import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class ProductSoldInfo extends StatelessWidget {
  final num sold;

  const ProductSoldInfo({super.key, required this.sold});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.fire, width: 12, height: 12),
          Text(
            'تم بيع+${sold}k',
            style: AppTextStyles.font10RegularPrimary().copyWith(
              color: AppColors.textAndIconGrey,
            ),
          ),
        ],
      ),
    );
  }
}
