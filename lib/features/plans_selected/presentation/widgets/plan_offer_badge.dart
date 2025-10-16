import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';

class PlanOfferBadge extends StatelessWidget {
  const PlanOfferBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.planOfferBadge, height: 33),
        Positioned(
          right: 4,
          bottom: 0,
          top: 10,
          child: Text(
            'أفضل قيمة مقابل سعر',
            style: AppTextStyles.font12Medium(color: Color(0xffFF4144)),
          ),
        ),
      ],
    );
  }
}
