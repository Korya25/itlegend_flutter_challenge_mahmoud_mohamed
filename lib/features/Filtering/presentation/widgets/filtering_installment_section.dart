// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class FilteringInstallmentSection extends StatelessWidget {
  const FilteringInstallmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'الأقساط الشهرية',
            style: AppTextStyles.font16PrimaryMeduim().copyWith(
              color: AppColors.textAndIconGrey,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_InstallmentCard(), _InstallmentCard()],
          ),
        ],
      ),
    );
  }
}

class _InstallmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 1,
              color: AppColors.textAndIconPrimary.withOpacity(0.1),
            ),
          ),
        ),
      ),
    );
  }
}
