// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class ProductBottomActions extends StatelessWidget {
  const ProductBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.company, height: 26, width: 26),
        Row(
          spacing: 16,
          children: [
            Container(
              width: 32,
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.cart,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textAndIconPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Image.asset(AppAssets.talaetMostafaPng, width: 15, height: 22),
          ],
        ),
      ],
    );
  }
}
