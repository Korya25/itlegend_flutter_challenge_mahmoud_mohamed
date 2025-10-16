import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/utils/context_exstions.dart';

class ProductName extends StatelessWidget {
  final String name;

  const ProductName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          '${name.limit(16)}...',
          style: AppTextStyles.font14MeduimPrimary(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(AppAssets.percentage, height: 20, width: 20),
        ),
      ],
    );
  }
}
