import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';

class PlansViewHeader extends StatelessWidget {
  const PlansViewHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'أختر الباقات اللى تناسبك',
              style: AppTextStyles.font24MeduimPrimary(),
            ),
            GestureDetector(
              onTap: () => context.pop(),
              child: SvgPicture.asset(AppAssets.arrow, width: 24, height: 24),
            ),
          ],
        ),
        Text(
          'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
          style: AppTextStyles.font14regularPrimary(),
        ),
      ],
    );
  }
}
