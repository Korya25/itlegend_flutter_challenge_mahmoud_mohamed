import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';

class PlansCardDateailItem extends StatelessWidget {
  const PlansCardDateailItem({
    super.key,
    required this.title,
    this.subTitle,
    required this.svgPath,
  });

  final String title;
  final String? subTitle;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    final bool isWorkspacePremium = svgPath == AppAssets.workspacePremium;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 2,
          children: [
            Text(
              title,
              style: AppTextStyles.font14MeduimPrimary().copyWith(
                fontWeight: isWorkspacePremium
                    ? FontWeightHelper.regular
                    : FontWeightHelper.medium,
              ),
              textAlign: TextAlign.right,
            ),
            if (subTitle != null)
              Text(
                '( $subTitle )',
                style: AppTextStyles.font14MeduimPrimary().copyWith(
                  color: const Color(0xffFF4144),
                ),
                textAlign: TextAlign.right,
              ),
          ],
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(svgPath, height: 24, width: 24),
      ],
    );
  }
}
