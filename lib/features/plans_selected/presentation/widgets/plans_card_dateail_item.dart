import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';

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
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 2,
          children: [
            Text(title, style: AppTextStyles.font14MeduimPrimary()),
            if (subTitle != null)
              Text(
                '( $subTitle )',
                style: AppTextStyles.font14MeduimPrimary().copyWith(
                  color: Color(0xffFF4144),
                ),
                maxLines: 1,
              ),
          ],
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(svgPath, height: 24, width: 24),
      ],
    );
  }
}
