// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filter_chipItem.dart';

class FilteringTypeSection extends StatefulWidget {
  const FilteringTypeSection({super.key});

  @override
  State<FilteringTypeSection> createState() => _FilteringTypeSectionState();
}

class _FilteringTypeSectionState extends State<FilteringTypeSection> {
  String selectedLabel = 'الكل';

  final List<String> types = ['فيلا منفصلة', 'توين هاوس', 'الكل', 'تاون هاوس'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'النوع',
            style: AppTextStyles.font16PrimaryMeduim().copyWith(
              color: AppColors.textAndIconGrey,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 12,
            runSpacing: 12,
            children: [
              ...types.map(
                (label) => FilterChipItem(
                  label: label,
                  isSelected: selectedLabel == label,
                  onTap: () {
                    setState(() {
                      selectedLabel = label;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
