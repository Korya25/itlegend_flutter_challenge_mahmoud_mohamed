// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class FilteringInstallmentSection extends StatelessWidget {
  const FilteringInstallmentSection({
    super.key,
    required this.label,
    this.leftBoxLabel,
    this.rightBoxLabel,
  });
  final String label;
  final String? leftBoxLabel;
  final String? rightBoxLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppTextStyles.font16PrimaryMeduim().copyWith(
            color: AppColors.textAndIconGrey,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _InstallmentCard(label: leftBoxLabel)),
            SizedBox(width: 12),
            Expanded(child: _InstallmentCard(label: rightBoxLabel)),
          ],
        ),
      ],
    );
  }
}

class _InstallmentCard extends StatelessWidget {
  const _InstallmentCard({this.label});
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          label ?? '',
          style: AppTextStyles.font14MeduimPrimary().copyWith(
            color: AppColors.textAndIconGrey,
          ),
        ),
      ),
    );
  }
}
