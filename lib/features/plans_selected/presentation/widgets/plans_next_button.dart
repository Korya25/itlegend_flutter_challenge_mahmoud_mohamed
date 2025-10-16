// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class PlansNextButton extends StatelessWidget {
  const PlansNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backPrimary,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.backPrimary,
          border: Border(
            top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Container(
            width: double.infinity,
            height: 44,
            decoration: ShapeDecoration(
              color: Color(0xFF0079FE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.arrowBack),
                Text(
                  'التالى',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font16Bold().copyWith(
                    color: AppColors.backPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
