import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/data/models/promo_banner_model.dart';

class PromoBannerCard extends StatelessWidget {
  final PromoBannerModel banner;

  const PromoBannerCard({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        color: AppColors.offerCategoriesCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(AppAssets.trueIcon),
              ),

              const SizedBox(width: 8),
              Text(banner.title, style: AppTextStyles.font12RegularGreen()),
            ],
          ),
          Text(banner.subtitle, style: AppTextStyles.font10RegularPrimary()),
        ],
      ),
    );
  }
}
