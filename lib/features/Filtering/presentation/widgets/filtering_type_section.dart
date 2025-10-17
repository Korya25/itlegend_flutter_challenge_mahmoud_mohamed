import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filter_chipItem.dart';

class FilteringTypeSection extends StatelessWidget {
  final String title;
  final List<String> types;
  final String selectedLabel;
  final ValueChanged<String> onChanged;

  const FilteringTypeSection({
    super.key,
    required this.title,
    required this.types,
    required this.selectedLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: AppTextStyles.font16PrimaryMeduim().copyWith(
              color: AppColors.textAndIconGrey,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 12,
            runSpacing: 12,
            children: types
                .map(
                  (label) => FilterChipItem(
                    label: label,
                    isSelected: selectedLabel == label,
                    onTap: () => onChanged(label),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
